--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 19:59
-- To change this template use File | Settings | File Templates.
--

return function()
    for k,v in pairs(F.train) do
        local line = GET(v.line)
        local route_ID = line.routes[v.route_count]
        v.station = GET(route_ID).to
        v.route_count = (v.route_count  % #line.routes) + 1

        for _,w in pairs(F.inMetro) do
            if w.action.train == v.ID then
             w.station = v.station
             core.filter.update(w)
            end
        end
        core.filter.update(v)
    end
end

