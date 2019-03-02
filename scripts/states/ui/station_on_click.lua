--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--

local circles = {
    { x = 80, y = 200 },
    { x = 160, y = 200 },
    { x = 240, y = 200 }
}
local renderDialog = function(x, y, station)
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.rectangle("fill", x, y, 300, 300)
    love.graphics.setColor(0.8, 0.8, 0.8)
    for k, v in ipairs(circles) do
        love.graphics.circle("fill", x + v.x, y + v.y, 30)
    end
    local presence = false
    for k, v in pairs(F.pcInMetro) do
    end
    local i = 0
    love.graphics.setColor(1, 0, 0)

    for k, v in pairs(F.pcOnStation) do
        i = i + 1
        local spot = circles[v.spot]
        if v.station == station.ID then
            if spot then
                love.graphics.circle("fill", x + spot.x, y + spot.y, 30)
            else
                error("too high spot number")
            end
        end
    end
    if presence then
        for k, v in pairs(F.policeOnStation) do
        end
    end
end
return function(x, y)
    local hovers = false
    local w, h = 300, 300
    return {
        onHover = function(xx, yy)
            local s_id = UIDATASTATE.GET({ 'station' })
            if not s_id then return end
            local station = GET(s_id)
            if not station then return end
            local x, y = station.position.x - 100, station.position.y + 50
            local xx, yy = CAM:toWorld(xx, yy)
            hovers = xx > x and xx < x + w and yy > y and yy < y + h
        end,
        draw = function()
            local s_id = UIDATASTATE.GET({ 'station' })
            if not s_id then return end
            local station = GET(s_id)
            if not station then return end
            local x, y = station.position.x - 100, station.position.y + 50

            CAM:draw(function()
                renderDialog(x, y, station)
            end)
            love.graphics.setColor(1, 1, 1)
        end,
        mousePressed = function(x, y, button)
            if button == 1 and not hovers and UIDATASTATE.GET({'station'}) then
                UIDATASTATE.PUT({'station'}, nil)
            end
        end,
        mouseReleased = function()
            if hovers then
            end
        end
    }
end