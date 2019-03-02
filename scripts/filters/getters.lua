--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:19
-- To change this template use File | Settings | File Templates.
--
local count = 0
function GET_ID ()
    count = count + 1
    return count
end
function GET(i)
    for _,v in pairs(F.ID) do
        if(v.ID == i ) then return v end
    end
    error("Cannot find object " .. tostring(i))
end

function TRAINGETFROMTO(train_id)
    local train = GET(train_id)
    local line = GET(train.line)
    local route_ID = line.routes[train.route_count]
    return  GET(route_ID).from,  GET(route_ID).to
end

function TRAINGETROUTE(train_id)
    local train = GET(train_id)
    local line = GET(train.line)
    local route_ID = line.routes[train.route_count]
    return  GET(route_ID)
end


function GET_SCREEN_POS(position)
    local camera = UIDATASTATE.GET({'scrol'})
    return {x = position.x - camera.x, y=position.y - camera.y}
end

function IS_PRESENT(station_ID)
    for k,v in pairs(F.playerCharacter) do
        if v.station == station_ID then return true end
    end
    return false
end