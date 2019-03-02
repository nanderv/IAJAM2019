--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:49
-- To change this template use File | Settings | File Templates.
--

return function(route)
    love.graphics.setLineWidth( 32 )
    local from = GET(route.station1)
    local to = GET(route.station2)


    love.graphics.line(from.position.x, from.position.y, to.position.x, to.position.y)
    love.graphics.setColor(1,1,1)
    love.graphics.setLineWidth( 4 )

end
