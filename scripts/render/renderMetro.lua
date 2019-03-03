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
    return station.position.x + xdir * 80 * (i + 1), station.position.y + ydir * 80 * (i + 1)
end

GETENTRYANGLE = function(train)
    local station = GET(train.station)
    local route = TRAINGETROUTE(train.ID)
    local lastBend = GET(route.from).position
    local bend = route.midpoints
    for k, v in ipairs(bend) do
        lastBend = v
    end
    return math.atan((lastBend.y - station.position.y) / (lastBend.x - station.position.x))
end

return function(train)
    local colour = GET(train.station).colour
    local img = RESOURCES.wagon[colour]

    for i = 1, train.capacity do
        local x, y = GETMETROSPOT(train, i)
        love.graphics.draw(img, x, y, GETENTRYANGLE(train), 2, 2, img:getWidth() / 2, img:getHeight() / 2)
    end

    for k, v in pairs(F.inMetro) do
        if v.action.train == train.ID then
            if v.isPolice then

                if IS_PRESENT(train.station) then
                else
                    love.graphics.setColor(0, 0, 0, 0)
                end
            end

            local x, y = GETMETROSPOT(GET(v.action.train), v.spot)
            scripts.render.renderCharacter(x, y, v.isPiece)
            love.graphics.setColor(1, 1, 1, 1)
        end
    end
end

