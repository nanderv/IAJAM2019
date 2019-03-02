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
            scripts.states.ui.end_turn_button(300, 300)
        },
        prevState="base_map_state"
    }
end