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

local roles = {
    'pickpocket',
    'employeet',
    'bombthreat',
    'spotter',
    'graffiti',
    'musician'
}
local adders
local roleFunctions = {
    hidden = {
        pickpocket = function(entity, results)
            local station = GET(entity.station)
            adders.add_crime(station, 1500)
        end,
        employeet = function(entity, results)
        end,
        bombthreat = function(entity, results)
        end,
        spotter = function(entity, results)
            print("DOES NOTHING")
            local station = GET(entity.station)
            adders.add_crime(station, 1500)
        end,
        graffiti = function(entity, results)
        end,
        musician = function(entity, results)
        end,
    },
    active = {
        pickpocket = function(entity, results) end,
        employeet = function(entity, results) end,
        bombthreat = function(entity, results) end,
        spotter = function(entity, results)
            print("DOES NOTHING ACTIVELY")
        end,
        graffiti = function(entity, results) end,
        musician = function(entity, results)
            local station = GET(entity.station)
            results.income = results.income  + math.max(0,station.pauper-50)/10
        end,
    }
}
local function newResults() return {
    arrested = 0,
    hiddenpickpocket = 0,
    hiddenemployeet = 0,
    hiddenbombthreat = 0,
    hiddenspotter = 0,
    hiddengraffiti = 0,
    hiddenmusician = 0,
    activepickpocket = 0,
    activeemployeet = 0,
    activebombthreat = 0,
    activespotter = 0,
    activegraffiti = 0,
    activemusician = 0,
    wages = 0,
    income = 0
}
end

local renderOrder = {
    { key = "arrested", name = "Arrested" },
}

local renderFinancial = {
    { key = "income", name = "Income" },
    { key = "wages", name = "Wages" },
}

local results = {}

return function()
    results = newResults()

    adders = scripts.systems.simulate.adders
    return {
        draw = function()
            CAM:draw(function()
                core.run("train", scripts.render.renderMetro)
            end)
            love.graphics.setColor(202 / 255, 183 / 255, 160 / 255)
            love.graphics.rectangle("fill", 300, 200, 1920 - 600, 1080 - 400)
            love.graphics.setColor(1, 1, 1)
            love.graphics.print("Turn summary", 310, 210)
            local i = 0
            for k, v in pairs(renderOrder) do
                i = i + 1
                love.graphics.print(v.name, 310, 210 + 40 * i)
                love.graphics.print(results[v.key], 510, 210 + 40 * i)
            end

            for k, v in pairs(renderFinancial) do
                i = i + 1
                love.graphics.print(v.name, 310, 610 + 40 * i)
                love.graphics.print(results[v.key], 510, 610 + 40 * i)
            end
        end,
        elements = {
            scripts.states.ui.next_turn_button(300, 300),
        },
        selected = nil,
        enter = function()
            for k, v in pairs(F.station) do
                v.disabled = nil
            end
            for _, v in pairs(roles) do

                for k, w in pairs(F["hidden" .. v]) do
                    roleFunctions.hidden[v](w, results)
                end
                for k, w in pairs(F["active" .. v]) do
                    roleFunctions.hidden[v](w, results)
                end
            end

            for k, v in pairs(F.playerCharacter) do
                local costs = COSTSPERUNIT[v.isPiece]
                adders.add_money(-costs[2])
                results.wages = results.wages + costs[2]
            end
        end,
        leave = function()
            results = newResults()
            RR = results
        end,
        mousePressed = function(x, y, button)
            --   MYSTATE.setState('do_turn')
        end,
        prevState = "base_map_state"
    }
end
