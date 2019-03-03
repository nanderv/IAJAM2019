--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 19:51
-- To change this template use File | Settings | File Templates.
--


return function(x, y, name, player_capacity, pauper, dirt, angle, colour)
    local station_ID = GET_ID()
    return {
        isStation = true,
        name = name,
        position = { x = x, y = y },
        playerCapacity = player_capacity,
        colour = colour,
        pauper = pauper or 0,
        dirt = dirt or 3,
        angle = angle or 0.25* math.pi,
        ID = station_ID,
    }, station_ID
end
