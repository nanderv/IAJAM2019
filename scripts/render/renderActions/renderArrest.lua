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
            love.graphics.setColor(0.7,0.7,0.7)
            love.graphics.rectangle("fill", stationPosition.x-100 , stationPosition.y + 100, 200,100)
            love.graphics.setColor(1,1,1)
            love.graphics.print("Agent arrested", stationPosition.x-80 , stationPosition.y + 160)
        end,
        initialize = function()

        end
    }
end