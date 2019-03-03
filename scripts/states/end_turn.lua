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


local function newResults() return {
    arrested = 0,
    pickpockets = 0,
    pickpocketsHiding = 0,
    musicians = 0,
    musiciansHiding = 0,
    musicianIncome = 0,
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
            -- set all the data

            for k,v in pairs(F.station) do
                v.disabled = nil

            end

        end,
        leave = function()
            results= newResults()
        end,
        mousePressed = function(x, y, button)
            --   MYSTATE.setState('do_turn')
        end,
        prevState = "base_map_state"
    }
end