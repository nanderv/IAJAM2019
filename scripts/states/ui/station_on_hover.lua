--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 03/03/2019
-- Time: 10:17
-- To change this template use File | Settings | File Templates.
--

--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--
local dist = function(pos1, pos2)
    local xd = (pos1.x - pos2.x)
    local yd = (pos1.y - pos2.y)
    return math.sqrt(xd * xd + yd * yd)
end
return function()

    local hovers
    return {
        onHover = function(x, y)
            local xx, yy = CAM:toWorld(x, y)
            hovers = nil
            for k, v in pairs(F.station) do
                if dist(v.position, { x = xx, y = yy }) < 100 then
                    hovers = v
                end
            end
        end,
        draw = function()
            if hovers then
                love.graphics.setColor(1,0,0,hovers.pauper/30)

                CAM:draw(function()
                    love.graphics.arc( "fill", hovers.position.x, hovers.position.y, 100, math.pi, 2*math.pi )


                    love.graphics.setColor(165/255,42/255,42/255, hovers.dirt/10)

                    love.graphics.arc( "fill", hovers.position.x, hovers.position.y, 100, 0, math.pi )


                    love.graphics.setColor(1, 1, 1)
                end)
            end
        end,
        mousePressed = function()
            if hovers then
                MOUSEMISSED = false
            end
        end
    }
end