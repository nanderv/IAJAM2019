--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 11:58
-- To change this template use File | Settings | File Templates.
--

local function renderSocket(x,y)

end
function GETSPOT(station, spot)
    return station.position.x +math.sin(station.angle)* 80*(spot+1), station.position.y + math.cos(station.angle) *  80*(spot+1)
end

-- Renders all characters for this station
return function(station)
    local count = 0

    for i=1, station.playerCapacity do

        local img = RESOURCES.diamond[station.colour]
        love.graphics.draw(img,station.position.x +math.sin(station.angle)* 80*(i +1), station.position.y + math.cos(station.angle) *  80*(i+1), station.angle, 2, 2, img:getWidth()/2, img:getHeight()/2 )
    end
    for k,v in pairs(F.pcOnStation) do
        if v.station == station.ID then
            count = count + 1
            local x, y = GETSPOT(station, v.spot)
            scripts.render.renderCharacter(x, y, v.isPiece)
        end
    end
    count = 0
    for k,v in pairs(F.policeOnStation) do
        if v.station == station.ID and IS_PRESENT(station.ID) then
            count = count + 1
        end
    end
    scripts.render.renderPolice(station.position.x +  math.sin(station.angle)*  80*(station.playerCapacity+2), station.position.y +math.cos(station.angle) * 80*(station.playerCapacity+2), count)

end

