--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:49
-- To change this template use File | Settings | File Templates.
--

return function(route)
    local from = GET(route.from)
    local to = GET(route.to)
    local prevPos = from.position
    for k,v in ipairs(route.midpoints) do
        love.graphics.line(prevPos.x, prevPos.y, v.x, v.y)
        prevPos = v
    end
    love.graphics.line(prevPos.x, prevPos.y, to.position.x, to.position.y)
end
