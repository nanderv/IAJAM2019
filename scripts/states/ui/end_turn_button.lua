--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--


return function(x,y)
    x,y = 1820, 1020
    local hovers = false
    local w,h = 100, 50
    return {
        onHover = function(xx,yy)
            hovers = xx>x and xx < x + w and yy > y and yy < y + h
        end,
        draw = function()
            if hovers then love.graphics.setColor(1,0,0) else love.graphics.setColor(0,1,0) end
            love.graphics.draw(RESOURCES.playButton,x,y)
        end,
        mousePressed = function()
            if hovers then
                MOUSEMISSED = false

                MYSTATE.setState('do_moving_metro')
                UIDATASTATE.PUT({ 'station' }, nil)
            end
        end
    }
end