--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:57
-- To change this template use File | Settings | File Templates.
--

local renderTrain = function(from, to, travelPercentage)
    local x = (from.x*(1-travelPercentage) + to.x*(travelPercentage) )
    local y = (from.y*(1-travelPercentage)+ to.y*(travelPercentage) )


    love.graphics.circle("fill",x,y, 30)
    love.graphics.setColor(1,1,1)
end
GETHOWFARONCURVE = function(d, x, T)
    return d*( 2 * math.pi * x - T * math.sin(2*math.pi*x / T) ) / (2 * T * math.pi)
end

return function()

    return function(event)
        for k,v in pairs(F.train) do
            local route = TRAINGETROUTE(v.ID)
            local from, to = GET(route.from), GET(route.to)
            local length = 0
            local prevPos = from.position
            for k,v in ipairs(route.midpoints) do
                local xd, yd = (prevPos.x - v.y), (prevPos.y - v.y)
                length = length + math.sqrt( xd * xd + yd * yd)
                prevPos = v
            end
            local xd, yd = (prevPos.x - to.position.y), (prevPos.y - to.position.y)
            length = length + math.sqrt( xd * xd + yd * yd)

            local d = length
            local T= event.otime
            local x = (event.otime - event.timeLeft )
            local distTraveled = GETHOWFARONCURVE(d, x, T)
            local prevPos = from.position
            local legLength = 0
            local early = false
            local red, green, blue=math.sin(v.ID), math.sin(2*v.ID), math.sin(3*v.ID)

            love.graphics.setColor(math.abs(red),math.abs(green), math.abs(blue))

            for k,v in ipairs(route.midpoints) do
                local xd, yd = (prevPos.x - v.y), (prevPos.y - v.y)
                legLength =  math.sqrt( xd * xd + yd * yd)
                if legLength > distTraveled then
                    early= true
                    renderTrain(prevPos, v, distTraveled / legLength)
                    break end
                distTraveled = distTraveled - legLength
                prevPos = v
            end
            if not early then
                local v = to.position
                local xd, yd = (prevPos.x - v.y), (prevPos.y - v.y)
                legLength =  math.sqrt( xd * xd + yd * yd)
                renderTrain(prevPos, v, distTraveled / legLength)
            end
        end
    end
end