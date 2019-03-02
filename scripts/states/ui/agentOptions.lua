--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--


return function()
    return {
        mousePressed = function(x, y, button)
            if button == 1 then

            end
        end,
        draw = function()
            local agent = UIDATASTATE.GET({ "agent" })
            if agent then
                local xx, yy
                if agent.action.train then
                    xx, yy = GETMETROSPOT(GET(agent.action.train), agent.spot)
                else
                    xx, yy = GETSPOT(GET(agent.station), agent.spot)
                end
                CAM:draw(function()
                    love.graphics.print("OPTIONS", xx+20, yy+50)
                end)
            end
        end
    }
end