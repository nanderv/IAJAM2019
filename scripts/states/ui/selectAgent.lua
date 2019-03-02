--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--

local findAgent = function(x, y)
    local x, y = CAM:toWorld(x, y)

    for k, v in pairs(F.pcInMetro) do
        -- print(v.train)

        local xx, yy = GETMETROSPOT(GET(v.action.train), v.spot)
        xx, yy = xx - x, yy - y

        if math.sqrt(xx * xx + yy * yy) < P.agentSize then
            return v
        end
    end
    for k, v in pairs(F.pcOnStation) do
        local xx, yy = GETSPOT(GET(v.station), v.spot)
        xx, yy = xx - x, yy - y

        if math.sqrt(xx * xx + yy * yy) < P.agentSize  then
            return v
        end
    end
end
local findSpot = function(x, y, agent)
    if findAgent(x, y) then return end
    local x, y = CAM:toWorld(x, y)

    for k, v in pairs(F.inMetro) do

        local xx, yy = GETMETROSPOT(GET(v.action.train), v.spot)
        xx, yy = xx - x, yy - y
        print(xx, yy, v.isPolice)
        if math.sqrt(xx * xx + yy * yy) < P.agentSize  then
            return
        end
    end


    local v = GET(agent.station)
    for i = 1, v.playerCapacity do
        local xx, yy = GETSPOT(v, i)
        print(xx, yy, x, y)
        xx, yy = xx - x, yy - y

        if math.sqrt(xx * xx + yy * yy) < P.agentSize  then
            return 'station', v, i
        end
    end



    for k, v in pairs(F.train) do
        -- print(v.train)
        for i = 1, 3 do
            local xx, yy = GETMETROSPOT(v, i)
            xx, yy = xx - x, yy - y

            if math.sqrt(xx * xx + yy * yy) < P.agentSize  then
                return 'metro', v, i
            end
        end
    end
end
return function()
    return {
        mousePressed = function(x, y, button)
            if button == 1 then
                local agent = findAgent(x, y)
                if agent then
                    UIDATASTATE.PUT({ "agent" }, agent)
                end
            elseif button == 2 then
                local agent = UIDATASTATE.GET({ "agent" })
                if not agent then return
                end
                local type, thing, spot = findSpot(x, y, agent)
                if type == 'station' then
                    agent.action = { 'act' }
                    agent.spot = spot
                    core.filter.update(agent)
                elseif type == 'metro' then
                    agent.action = scripts.entities.actions.in_metro(thing.ID)
                    agent.spot = spot
                    core.filter.update(agent)
                end
            end
        end,
        draw = function()
            local agent = UIDATASTATE.GET({ "agent" })
            if agent then
                local xx, yy
                if agent.action.train then
                    xx, yy = GETMETROSPOT(GET(agent.action.train), agent.spot)
                else
                    xx, yy = GETSPOT(GET(agent.station), agent.spot)
                end
                CAM:draw(function()
                    love.graphics.setColor(1, 0, 0)
                    love.graphics.circle('line', xx, yy, P.agentSize + 1)
                    love.graphics.setColor(1, 1, 1)
                end)
            end
        end
    }
end