--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 15:27
-- To change this template use File | Settings | File Templates.
--


return function(stationPosition)

    return {
        draw = function(event)
            local t = event.otime - event.timeLeft
            local T = event.otime

                -- move the camera
                local oCam = UIDATASTATE.GET({'prevcam'})
                local howFar = t/(T)
                CAM:setScale((howFar) * 1.5 + (1-howFar)*oCam.zoom)
                local x = howFar*stationPosition.x + (1-howFar)*oCam.x
                local y = howFar*stationPosition.y + (1-howFar)*oCam.y
                CAM:setPosition(x, y)
        end,
        initialize = function()
            local x, y =CAM:getPosition()
            local sc = UIDATASTATE.GET({'scrol'})
            UIDATASTATE.PUT({ "prevcam" }, { x = x, y = y, zoom = CAM:getScale()})

        end
    }
end