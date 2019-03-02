--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:42
-- To change this template use File | Settings | File Templates.
--



--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:39
-- To change this template use File | Settings | File Templates.
--

--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 28/02/2019
-- Time: 11:48
-- To change this template use File | Settings | File Templates.
--
local sq = require "lib.UI.square"
local dist = function(pos1, pos2)
    local xd = (pos1.x - pos2.x)
    local yd = (pos1.y - pos2.y)
    return math.sqrt(xd * xd + yd * yd)
end
return function()
    return {
        draw = function()
        end,
        selected = nil,
        enter = function()
        end,
        leave = function() end,
        update = function()
        end,
        elements = {
            scripts.states.ui.end_turn_button(300, 300),
            scripts.states.ui.station_on_click(300, 300)
        },
        mousePressed = function(x, y, button)
            local xx, yy = CAM:toWorld(x, y)
            if button == 1 then
                for k, v in pairs(F.station) do
                    if dist(v.position, { x = xx, y = yy }) < 30 then
                        print("CLICKED ON STATION " .. v.ID)
                        UIDATASTATE.PUT({ "station" }, v.ID)
                    end
                end
            end
        end,
        prevState = "base_map_state"
    }
end