--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 10:17
-- To change this template use File | Settings | File Templates.
--

local sq = require "lib.UI.square"
return function()
    return {
        draw = function()
            CAM:draw( function()
                MYSTATE.setState("do_turn")

            end)
        end,
        selected = nil,
        enter = function()
            for k,v in pairs(F.A) do
                core.entity.remove(v)
            end
            scripts.maps[UIDATASTATE.GET({"map"})].generate()

        end,
        leave = function() end,

    }
end

