--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:39
-- To change this template use File | Settings | File Templates.
--

--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 28/02/2019
-- Time: 11:48
-- To change this template use File | Settings | File Templates.
--
local sq = require "lib.UI.square"
return function()
    return {
        draw = function()
            print("HERE")
            CAM:draw( function()
                scripts.render.actions.draw()
            end)
        end,
        selected = nil,
        enter = function()

            scripts.systems.simulate.move_trains()
            scripts.render.actions.add(5, scripts.render.renderActions.moveMetro())
            scripts.render.actions.switch()
        end,
        leave = function() end,
        update = function(dt)
            scripts.render.actions.update(dt)
        end,

        prevState="base_map_state"
    }
end