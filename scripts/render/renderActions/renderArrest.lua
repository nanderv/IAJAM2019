--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 15:27
-- To change this template use File | Settings | File Templates.
--


return function(scum)

    return {
        draw = function(event)
            local t = event.otime - event.timeLeft
            local T = event.otime
            local stationPosition = GET(scum.station).position
            love.graphics.print("Agent arrested", stationPosition.x , stationPosition.y + 40)
        end,
        initialize = function()

        end
    }
end