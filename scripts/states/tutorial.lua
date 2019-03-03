--
-- Created by IntelliJ IDEA.
-- User: myrthe
-- Date: 03/03/19
-- Time: 15:49
-- To change this template use File | Settings | File Templates.
--

return function()
    return {
        draw = function()
            CAM:draw(function()
                local scale = 10
                love.graphics.draw(RESOURCES.tutorialScreen, 1500, -200, 0, scale, scale, 0, 0)
            end)
        end,
        keypressed = function(key, scancode, isRepeat)
            if (key == 'f11') then
                local isFullscreen, fstype = love.window.getFullscreen()
                love.window.setFullscreen(not isFullscreen)
            else
                MYSTATE.setState("load_map")
            end
        end,
        mousePressed = function()
            MYSTATE.setState("load_map")
        end,
    }
end