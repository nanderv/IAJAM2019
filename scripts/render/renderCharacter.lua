--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 11:25
-- To change this template use File | Settings | File Templates.
--
local function draw(x,y,character)

    love.graphics.circle('fill', x,y, 40)
end
return function (x, y, character, on_map)
    draw(x,y,character)
end

