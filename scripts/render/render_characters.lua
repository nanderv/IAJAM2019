--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 11:58
-- To change this template use File | Settings | File Templates.
--
function GETSPOT(station, spot)
    return station.position.x +math.sin(station.angle)* 20*(spot+1), station.position.y + math.cos(station.angle) *  20*(spot+1)
end

-- Renders all characters for this station
return function(station)
    local count = 0

    love.graphics.setColor(0.5,0.5,0.5)
    for i=1, station.playerCapacity do
        love.graphics.circle("fill",station.position.x +math.sin(station.angle)* 20*(i +1), station.position.y + math.cos(station.angle) *  20*(i+1), 10)
    end
    love.graphics.setColor(1,1,1)
    for k,v in pairs(F.pcOnStation) do
        if v.station == station.ID then
            count = count + 1
            local x, y = GETSPOT(station, v.spot)
            scripts.render.renderCharacter(x, y)
        end
    end
    count = 0
    for k,v in pairs(F.policeOnStation) do
        if v.station == station.ID and IS_PRESENT(station.ID) then
            count = count + 1
        end
    end
    scripts.render.renderPolice(station.position.x +  math.sin(station.angle)*  20*(station.playerCapacity+2), station.position.y +math.cos(station.angle) * 20*(station.playerCapacity+2), count)

end

