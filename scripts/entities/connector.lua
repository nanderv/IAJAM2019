--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 19:51
-- To change this template use File | Settings | File Templates.
--


return function(station1, station2)
    local station_ID = GET_ID()
    return {
        isConnector = true,
        station1 = station1,
        station2 = station2,
        ID = station_ID,
    }, station_ID
end
