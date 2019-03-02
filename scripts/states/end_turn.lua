--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 10:32
-- To change this template use File | Settings | File Templates.
--

--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 10:32
-- To change this template use File | Settings | File Templates.
--
local scumValues = {
    spotter = 1,
    bombThreat = 0,
}

local function arrest(scum)
    local stationPosition = GET(scum.station).position
    local act = scripts.render.renderActions.moveCameraTo(stationPosition)
    scripts.render.actions.add(1, act.draw, act.initialize)
    local act = scripts.render.renderActions.renderArrest(scum)
    scripts.render.actions.add(4, act.draw, act.initialize)
    if UIDATASTATE.GET({ "agent" }) == scum then
        UIDATASTATE.PUT({ "agent" }, nil)
    end
    core.entity.remove(scum)
end

local function get_metro(police)
    local trainList = {}
    for k, v in pairs(F.train) do
        if v.station == police.station then
            trainList[#trainList + 1] = v
        end
    end
    return trainList[math.random(#trainList)]
end

local function clean(station)

    local act = scripts.render.renderActions.renderCleaning(station)
    scripts.render.actions.add(5, act.draw, act.initialize)
end

local function get_best_scum(station_ID)
    local scum
    local scumScore = 0
    for k, v in pairs(F.pcOnStation) do
        local score = scumValues[v.isPiece]
        if score > scumScore and v.station == station_ID then
            scum = v
            scumScore = score
        end
    end
    return scum
end

local sq = require "lib.UI.square"
return function()
    return {
        draw = function()
            CAM:draw(function()

                core.run("train", scripts.render.renderMetro)
            end)
            love.graphics.print("Here should be your rendering code for rendering the end-of-turn summary", 400, 400)

        end,
        elements = {
            scripts.states.ui.next_turn_button(300, 300),
        },

        selected = nil,
        enter = function()
            -- Do the action for each police officer.

        end,
        leave = function() end,

        mousePressed = function(x, y, button)
         --   MYSTATE.setState('do_turn')
        end,
        prevState = "base_map_state"
    }
end