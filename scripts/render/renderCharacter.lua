--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 11:25
-- To change this template use File | Settings | File Templates.
--
local function draw(x,y,character)
    local img = RESOURCES.roles[character]
    love.graphics.draw(img, x, y, 0, 2, 2, img:getWidth()/2, img:getHeight()/2 )

end
return function (x, y, character, on_map)
    draw(x,y,character)
end

