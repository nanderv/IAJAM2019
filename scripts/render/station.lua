--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:49
-- To change this template use File | Settings | File Templates.
--

return function(station)
    local img = RESOURCES.station[station.colour]
    love.graphics.draw(img, station.position.x, station.position.y, 0, 2, 2, img:getWidth()/2, img:getHeight()/2 )
    --station.angle = station.angle+0.005
end