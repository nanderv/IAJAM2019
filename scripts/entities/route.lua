--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 19:54
-- To change this template use File | Settings | File Templates.
--

-- This is a 'basic' line route. More complex routes might be possible (spline-based?)
return function(from, to, midpoints)
    local route_ID = GET_ID()
    return {
        isRoute = true,
        from = from,
        to = to,
        midpoints = midpoints or {},
        ID  = route_ID
    }, route_ID
end

