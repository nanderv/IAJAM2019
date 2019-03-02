--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 11:25
-- To change this template use File | Settings | File Templates.
--
local function draw(x,y,character)
    love.graphics.setColor(0,0,1)
    love.graphics.circle('fill', x,y, 40)
    love.graphics.setColor(1,1,1)
end
return function (x, y, count)
    if count > 0 then
        draw(x,y)
    end
end

