--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--
local getActions = {
    police = {},
    pickpocket = {
        'hidden',
        'delete'
    },
    employeet = {},
    bombthreat = {},
    spotter = { 'delete' },
    graffiti = {},
    musician = {}
}

local functions = {
    hidden = function(agent)
        agent.action.hide = not agent.action.hide
    end,
    delete = function(agent)
        core.entity.remove(agent)
        UIDATASTATE.PUT({'agent'}, nil)
    end

}
local function getAgentPosition(agent, i, len)
    if agent then
        local xx, yy
        local angle
        if agent.action.train then
            xx, yy = GETMETROSPOT(GET(agent.action.train), agent.spot)
            angle = 0
            return xx + (-50 + 60 * i), yy + 80, angle
        else
            xx, yy = GETSPOT(GET(agent.station), agent.spot)
            angle = GET(agent.station).angle
        end
        local xxdir = math.sin(angle)
        local xydir = math.cos(angle)
        local yxdir = math.sin(angle + 0.5 * math.pi)
        local yydir = math.cos(angle + 0.5 * math.pi)
        local xr = -yxdir * 80 + xxdir * (-50 + 60 * i)
        local yr = -yydir * 80 + xydir * (-50 + 60 * i)
        return xx + xr, yy + yr, angle
    end
end

return function()
    return {
        mousePressed = function(x, y, button)
            x,y = CAM:toWorld(x,y)
            if button == 1 then
                local agent = UIDATASTATE.GET({ "agent" })
                if agent then
                    local actions = getActions[agent.isPiece]
                    for i = 1, #actions do

                        local xx, yy, angle = getAgentPosition(agent, i, #actions)
                        if xx then
                            xx, yy = xx - x, yy - y
                            local dist = math.sqrt(xx*xx + yy * yy)
                            if dist < P.agentSize then
                                MOUSEMISSED = false

                                functions[actions[i]](agent)
                            end
                        end
                    end
                end
            end
        end,
        draw = function()
            local agent = UIDATASTATE.GET({ "agent" })
            if agent then
                local actions = getActions[agent.isPiece]
                CAM:draw(function()
                    for i = 1, #actions do

                        local x, y, angle = getAgentPosition(agent, i, #actions)
                        if x then
                            if actions[i] == 'hidden' then
                                if agent.action.hide then
                                love.graphics.draw(RESOURCES.action[actions[i]], x, y, 0, 2, 2, 15,15)
                                else
                                    love.graphics.draw(RESOURCES.action['visible'], x, y, 0, 2, 2, 15,15)
                                end
                            else
                                love.graphics.draw(RESOURCES.action[actions[i]], x, y, 0, 2, 2, 15,15)
                            end
                        end
                    end
                end)
            end
        end
    }
end