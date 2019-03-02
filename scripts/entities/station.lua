--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 19:51
-- To change this template use File | Settings | File Templates.
--


return function(x, y, name, player_capacity, pauper, dirt)
    local station_ID = GET_ID()
    return {
        isStation = true,
        name = name,
        position = { x = x, y = y },
        playerCapacity = player_capacity,
        pauper = pauper or 0,
        dirt = dirt or 0,
        ID = station_ID,
    }, station_ID
end
