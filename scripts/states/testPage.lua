--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 28/02/2019
-- Time: 11:48
-- To change this template use File | Settings | File Templates.
--
local sq = require "lib.UI.square"
return function()
    return {
        draw = function()
        end,
        selected = nil,
        enter = function() end,
        leave = function() end,
        update = function()

        end,
        prevState="base_map_state"
    }
end