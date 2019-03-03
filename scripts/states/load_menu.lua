--
-- Created by IntelliJ IDEA.
-- User: tkerkhoven
-- Date: 3-3-19
-- Time: 14:21
-- To change this template use File | Settings | File Templates.
--

return function()
    return {
        draw = function()
            CAM:draw(function()
                local scale = 10
                love.graphics.draw(RESOURCES.startScreen, 0, -200, 0, scale, scale, 0, 0)
            end)
        end,
        keypressed = function(key, scancode, isRepeat)
            if (key == 'f11') then
                local isFullscreen, fstype = love.window.getFullscreen()
                love.window.setFullscreen(not isFullscreen)
            else
                MYSTATE.setState("tutorial")
            end
        end,
        mousePressed = function()
            MYSTATE.setState("tutorial")
        end,
    }
end

