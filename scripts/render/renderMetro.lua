--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 18:14
-- To change this template use File | Settings | File Templates.
--

return function(train)
    local station = GET(train.station)
    local route = TRAINGETROUTE(train.ID)

    local from = GET(route.from).position
    for k,v in ipairs(route.midpoints) do
        from = v
    end
    local to = GET(route.to).position
    local xx, yy = (to.x - from.x ), (to.y - from.y )
    local len = math.sqrt(xx * xx + yy * yy)
    local xdir, ydir  = -xx/len, -yy / len

    love.graphics.circle("fill", station.position.x + xdir * 40, station.position.y+ydir*40, 20)
end

