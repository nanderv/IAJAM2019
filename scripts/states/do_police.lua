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
                scripts.render.actions.draw()
                core.run("train", scripts.render.renderMetro)
            end)
        end,
        selected = nil,
        enter = function()
            -- Do the action for each police officer.
            for k, v in pairs(F.policeOnStation) do
                -- if station.hasScum:
                --- Arrest one scum
                local scum = get_best_scum(v.station)
                if scum ~= nil then
                    arrest(scum)
                    v.action = { type = "arrest" }
                    core.filter.update(v)
                else
                    local station = GET(v.station)
                    if station.dirt > 0 then
                        clean(station)
                        v.action = { type = "dirt" }
                        core.filter.update(v)
                        v.STATIONCOUNTER = 0
                    else
                        -- try to board train
                        local train = get_metro(v)
                        if train then
                            local slot
                            local founds = { 1, 2, 3 }
                            for k, v in pairs(F.inMetro) do
                                if v.action.train == train.ID then
                                    founds[v.spot] = nil
                                end
                            end
                            for k, v in pairs(founds) do
                                slot = v
                                break
                            end
                            if slot then
                                v.slot = slot
                                v.action = scripts.entities.actions.in_metro(train.ID)
                            end
                            core.filter.update(v)
                        end
                    end
                end
            end
            for k, v in pairs(F.policeInMetro) do
                -- if station.hasScum:
                --- Officer leaves train
                --- Arrest one scum

                local scum = get_best_scum(v.station)
                if scum ~= nil then
                    arrest(scum)
                    v.action = { type = "arrest" }
                    v.STATIONCOUNTER = 0
                    core.filter.update(v)
                else
                    v.STATIONCOUNTER = v.STATIONCOUNTER + 1
                    local routeLength = #GET(GET(v.action.train).line).routes
                    if v.STATIONCOUNTER > routeLength then

                        core.entity.remove(v)
                    end
                end
            end
            scripts.render.actions.switch()
        end,
        leave = function() end,
        update = function(dt)
            if not scripts.render.actions.update(dt) then
                MYSTATE.setState('do_turn')
            end
        end,
        mousePressed = function(x, y, button)
            if button == 1 then
                scripts.render.actions.counter = scripts.render.actions.counter + 1
            end
        end,
        prevState = "base_map_state"
    }
end