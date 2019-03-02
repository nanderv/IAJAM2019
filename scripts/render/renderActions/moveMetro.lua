--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:57
-- To change this template use File | Settings | File Templates.
--

return function()

    return function(event)
        for k,v in pairs(F.train) do
            local from, to = TRAINGETFROMTO(v.ID)
            from, to = GET(from), GET(to)
            local x = (from.position.x*event.timeLeft + to.position.x*(event.otime - event.timeLeft) ) / event.otime
            local y = (from.position.y*event.timeLeft + to.position.y*(event.otime - event.timeLeft) ) / event.otime
            local red, green, blue=math.sin(v.ID), math.sin(2*v.ID), math.sin(3*v.ID)

            love.graphics.setColor(math.abs(red),math.abs(green), math.abs(blue))

            love.graphics.circle("fill",x,y, 30)
            love.graphics.setColor(1,1,1)


        end
    end

end