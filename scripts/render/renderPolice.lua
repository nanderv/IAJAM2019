--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 11:25
-- To change this template use File | Settings | File Templates.
--
local function draw(x,y,character)
    local img = RESOURCES.roles['police']
    love.graphics.draw(img, x, y, 0, 8, 8, img:getWidth()/2, img:getHeight()/2 )

end
return function (x, y, count)
    if count > 0 then
        draw(x,y)
    end
end

