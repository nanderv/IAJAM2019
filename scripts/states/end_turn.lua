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

local roleFunctions = {
    hidden = {
        pickpocket =  function(entity, results)

        end,
        employeet =  function(entity, results)

        end,
        bombthreat =  function(entity, results)

        end,
        spotter =  function(entity, results)
            print("DOES NOTHING")
        end,
        graffiti =  function(entity, results)

        end,
        musician = function(entity, results)

        end,
    },
    active = {
        pickpocket =  function(entity, results)  end,
        employeet =  function(entity, results)  end,
        bombthreat =  function(entity, results)  end,
        spotter =  function(entity, results)
            print("DOES NOTHING ACTIVELY")
        end,
        graffiti =  function(entity, results)  end,
        musician = function(entity, results)  end,
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
}
end

local results  = {}

return function()
    return {
        draw = function()
            CAM:draw(function()
                core.run("train", scripts.render.renderMetro)
            end)
            love.graphics.setColor(202 / 255, 183 / 255, 160 / 255)
            love.graphics.rectangle("fill", 300, 200, 1920-600, 1080-400)
            love.graphics.setColor(1, 1, 1)
            love.graphics.print("Here should be your rendering code for rendering the end-of-turn summary", 400, 400)
        end,
        elements = {
            scripts.states.ui.next_turn_button(300, 300),
        },
        selected = nil,
        enter = function()
            for k,v in pairs(F.station) do
                v.disabled = nil
            end
            for _,v in pairs(roles) do

                for k,w in pairs(F["hidden"..v]) do
                    roleFunctions.hidden[v](w, results)
                end
                for k,w in pairs(F["active"..v]) do
                    roleFunctions.hidden[v](w, results)
                end
            end


        end,
        leave = function()
            results= newResults()
            RR = results
        end,
        mousePressed = function(x, y, button)
            --   MYSTATE.setState('do_turn')
        end,
        prevState = "base_map_state"
    }
end