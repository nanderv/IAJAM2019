--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 15:27
-- To change this template use File | Settings | File Templates.
--


return function(station)

    return {
        draw = function(event)
            local t = event.otime - event.timeLeft
            local T = event.otime
            local stationPosition = station.position
            love.graphics.print("Station Cleaned", stationPosition.x , stationPosition.y + 160)
        end,
        initialize = function()

        end
    }
end