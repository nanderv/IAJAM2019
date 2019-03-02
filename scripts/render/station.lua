--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:49
-- To change this template use File | Settings | File Templates.
--

return function(station)
    love.graphics.draw(RESOURCES.station[station.colour], station.position.x, station.position.y, 0, 2, 2, 50, 50)

end