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
            if not scripts.render.actions.update(dt) then
                MYSTATE.setState('do_police')
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