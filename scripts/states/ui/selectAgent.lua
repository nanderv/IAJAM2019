--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--

local findAgent = function(x, y)
    local x, y = CAM:toWorld(x, y)
    for k, v in pairs(F.pcInMetro) do
        -- print(v.train)

        local xx, yy = GETMETROSPOT(GET(v.action.train), v.spot)
        xx, yy = xx - x, yy - y

        if math.sqrt(xx * xx + yy * yy) < 10 then
            return v
        end
    end
    for k, v in pairs(F.pcOnStation) do
        print(v.station, v.spot)
        local xx, yy = GETSPOT(GET(v.station), v.spot)
        xx, yy = xx - x, yy - y

        if math.sqrt(xx * xx + yy * yy) < 10 then
            return v
        end
    end
end

return function()
    return {
        mousePressed = function(x, y, button)
            if button == 1 then
                local agent = findAgent(x, y)
                if agent then
                    UIDATASTATE.PUT({ "agent" }, agent)
                end
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
                love.graphics.setColor(1, 0, 0)
                love.graphics.circle('line', xx, yy, 11)
                love.graphics.setColor(1, 1, 1)
                end)
            end
        end
    }
end