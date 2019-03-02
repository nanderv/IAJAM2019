--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 10:32
-- To change this template use File | Settings | File Templates.
--
local scumValues ={
    spotter = 1,
    bombThreat = 0,

}

local function arrest(scum)
    pprint(scum)
    local stationPosition = GET(scum.station).position
    local act = scripts.render.renderActions.moveCameraTo(stationPosition)
    scripts.render.actions.add(1, act.draw, act.initialize )
    local act = scripts.render.renderActions.renderArrest(scum)
    scripts.render.actions.add(4, act.draw, act.initialize )

    core.entity.remove(scum)
    print("ada")
end
local function clean(station)

    local act = scripts.render.renderActions.renderCleaning(station)
    scripts.render.actions.add(5, act.draw, act.initialize )
    print("ada")
end

local function get_best_scum(station_ID)
    local scum
    local scumScore  = 0
    for k,v in pairs(F.playerCharacter) do
        local score = scumValues[v.isPiece]
        if score > scumScore and v.station == station_ID then
            scum = v
            scumScore = score
        end
    end
    print(scumScore)
    return scum
end

local sq = require "lib.UI.square"
return function()
    return {
        draw = function()
            CAM:draw( function()
                scripts.render.actions.draw()
            end)
        end,
        selected = nil,


        enter = function()
            print("HERE")
            -- Do the action for each police officer.
            for k,v in pairs(F.policeOnStation) do
                -- if station.hasScum:
                --- Arrest one scum
                local scum = get_best_scum(v.station)
                if scum ~= nil then
                    arrest(scum)
                else
                    local station = GET(v.station)
                    if station.dirt > 0 then
                        clean(station)
                    else
                        -- try to board train
                    end


                end
            end
            for k,v in pairs(F.policeInMetro) do
                -- if station.hasScum:
                --- Officer leaves train
                --- Arrest one scum
                print("STATION", v.station)

                local scum = get_best_scum(v.station)
                if scum ~= nil then
                    arrest(scum)
                end
                -- if not station.hasScum
                --- officer enters one of the trains, if available

            end
            scripts.render.actions.switch()

        end,
        leave = function() end,
        update = function(dt)
            if not scripts.render.actions.update(dt) then
                MYSTATE.setState('do_turn')
            end
        end,
        mousePressed = function(x,y, button)
            if  button == 1 then
                scripts.render.actions.counter = scripts.render.actions.counter + 1
            end
        end,

        prevState="base_map_state"
    }
end