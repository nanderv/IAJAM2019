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
local findSpot = function(x, y)
    if findAgent(x, y) then return end
    local x, y = CAM:toWorld(x, y)

    for k, v in pairs(F.inMetro) do

        local xx, yy = GETMETROSPOT(GET(v.action.train), v.spot)
        xx, yy = xx - x, yy - y
        if math.sqrt(xx * xx + yy * yy) < P.agentSize then
            return
        end
    end


    for k, v in pairs(F.station) do
        if IS_PRESENT(v.ID) then
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
        if IS_PRESENT(v.station) then
            for i = 1, v.capacity do
                local xx, yy = GETMETROSPOT(v, i)
                xx, yy = xx - x, yy - y

                if math.sqrt(xx * xx + yy * yy) < P.agentSize then
                    return 'metro', v, i
                end
            end
        end
    end
end
return function()
    return {
        mousePressed = function(x, y, button)
            if button == 1 then
                local type, thing, spot = findSpot(x, y)
                local agent = scripts.entities.spotter(nil, 1, {}, UIDATASTATE.GET({ 'new_agenttype' }))
                if type == 'station' then
                    MOUSEMISSED = false
                    agent.station = thing.ID
                    agent.action = { 'act' }
                    agent.spot = spot
                    core.filter.update(agent)
                    MYSTATE.setState('do_turn')
                elseif type == 'metro' then
                    MOUSEMISSED = false
                    agent.action = scripts.entities.actions.in_metro(thing.ID)
                    agent.station = thing.station
                    agent.spot = spot
                    MYSTATE.setState('do_turn')
                    core.filter.update(agent)
                end
            end
        end,
        elements={

        },
        draw = function()
            RENDERINFO(UIDATASTATE.GET({'new_agenttype'}))
        end
    }
end