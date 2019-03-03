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
            love.graphics.setColor(0.7,0.7,0.7)
            love.graphics.rectangle("fill", stationPosition.x-200 , stationPosition.y + 100, 400,100)
            love.graphics.setColor(1,1,1)
            love.graphics.draw(RESOURCES.cleaned, stationPosition.x-180 , stationPosition.y + 130)
        end,
        initialize = function()

        end
    }
end