--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:49
-- To change this template use File | Settings | File Templates.
--

return function(route)
    love.graphics.setLineWidth( 32 )
    local from = GET(route.from)
    local to = GET(route.to)
    local prevPos = from.position
    local colours = RESOURCES.colours[route.colour]
    love.graphics.setColor(colours.r, colours.g, colours.b)
    for k,v in ipairs(route.midpoints) do
        love.graphics.line(prevPos.x, prevPos.y, v.x, v.y)
        love.graphics.circle("fill", v.x, v.y, 16)
        prevPos = v
    end
    love.graphics.line(prevPos.x, prevPos.y, to.position.x, to.position.y)
    love.graphics.setColor(1,1,1)
    love.graphics.setLineWidth( 4 )

end
