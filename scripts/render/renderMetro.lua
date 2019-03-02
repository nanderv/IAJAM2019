--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 18:14
-- To change this template use File | Settings | File Templates.
--
GETMETROSPOT = function(train, i)
    local station = GET(train.station)
    local route = TRAINGETROUTE(train.ID)

    local from = GET(route.from).position
    for k, v in ipairs(route.midpoints) do
        from = v
    end
    local to = GET(route.to).position
    local xx, yy = (to.x - from.x), (to.y - from.y)
    local len = math.sqrt(xx * xx + yy * yy)
    local xdir, ydir = -xx / len, -yy / len
    return station.position.x + xdir * 20 * (i + 1), station.position.y + ydir * 20 * (i + 1)
end
return function(train)

    love.graphics.setColor(0.5, 0.5, 0.5)
    for i = 1, 3 do
        local x, y = GETMETROSPOT(train, i)
        love.graphics.circle("fill", x, y, 10)
    end
    love.graphics.setColor(1,1,1)

    for k, v in pairs(F.inMetro) do
        if v.action.train == train.ID then
            local x, y = GETMETROSPOT(GET(v.action.train), v.spot)
            love.graphics.circle("fill", x, y, 10)
        end
    end
end

