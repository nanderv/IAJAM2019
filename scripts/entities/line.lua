--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 19:57
-- To change this template use File | Settings | File Templates.
--

-- r= .. , g = .., b = ..
return function(routes, colour)
    local line_ID = GET_ID()
    return {
        isLine = true,
        line_ID = line_ID,
        colour = colour,
        routes = routes,
        ID = line_ID
    }, line_ID
end

