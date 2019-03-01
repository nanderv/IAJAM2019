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

    love.graphics.line(from.position.x, from.position.y, to.position.x, to.position.y)
end
