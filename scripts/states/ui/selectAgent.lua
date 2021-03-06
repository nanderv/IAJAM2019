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

        if math.sqrt(xx * xx + yy * yy) < P.agentSize then
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
        if math.sqrt(xx * xx + yy * yy) < P.agentSize then
            return
        end
    end


    local s = GET(agent.station)
    for k, v in pairs(F.station) do
        if IS_CONNECTED(s.ID, v.ID) then
            for i = 1, v.playerCapacity do
                local xx, yy = GETSPOT(v, i)
                xx, yy = xx - x, yy - y
                if math.sqrt(xx * xx + yy * yy) < P.agentSize then
                    return 'station', v, i
                end
            end
        end
    end

    for k, v in pairs(F.train) do
        -- print(v.train)
        for i = 1, v.capacity do
            local xx, yy = GETMETROSPOT(v, i)
            xx, yy = xx - x, yy - y

            if math.sqrt(xx * xx + yy * yy) < P.agentSize then
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
                    MOUSEMISSED = false
                end
            elseif button == 2 then
                local agent = UIDATASTATE.GET({ "agent" })
                if not agent then return
                end
                MOUSEMISSED = false
                local type, thing, spot = findSpot(x, y, agent)
                if type == 'station' then
                    agent.action = { 'act' }
                    agent.station = thing.ID
                    agent.spot = spot
                    core.filter.update(agent)
                elseif type == 'metro' then
                    agent.action = scripts.entities.actions.in_metro(thing.ID)
                    agent.station = thing.station
                    agent.spot = spot
                    core.filter.update(agent)
                end
            end
        end,
        draw = function()
            local agent = UIDATASTATE.GET({ "agent" })
            if agent then
                RENDERINFO(agent.isPiece)
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