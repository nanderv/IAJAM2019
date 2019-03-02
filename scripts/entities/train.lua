--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:00
-- To change this template use File | Settings | File Templates.
--
return function(line, route_count, capacity)
    local train_ID = GET_ID()
    return {
        isTrain = true,
        line = line,
        capacity = capacity or 1,
        route_count = route_count,
        station = GET(GET(GET(line).routes[route_count]).to).ID,
        ID = train_ID,
    }, train_ID
end

