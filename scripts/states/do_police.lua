--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 10:32
-- To change this template use File | Settings | File Templates.
--

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
            -- Do the action for each police officer.
            for k,v in pairs(F.policeOnStation) do
                -- if station.hasScum:
                --- Arrest one scum

                -- if not station.hasScum
                --- officer enters one of the trains, if available

            end
            for k,v in pairs(F.policeInMetro) do
                -- if station.hasScum:
                --- Officer leaves train
                --- Arrest one scum

                -- if not station.hasScum
                --- officer enters one of the trains, if available

            end
        end,
        leave = function() end,
        update = function(dt)
            if not scripts.render.actions.update(dt) then
                MYSTATE.setState('do_turn')
            end
        end,

        prevState="base_map_state"
    }
end