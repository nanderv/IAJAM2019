--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 03/03/2019
-- Time: 11:49
-- To change this template use File | Settings | File Templates.
--
local funcs = {}
function funcs.add_crime(station, amount)
    station.pauper = station.pauper + amount
    GLOBALSTATS.crime = GLOBALSTATS.crime + amount
    if station.pauper > 30 then
        core.entity.add(scripts.entities.police(station.ID, {}))
        station.pauper = station.pauper - 100
    end
end

function funcs.add_money(amount)
    GLOBALSTATS.money = GLOBALSTATS.money + amount
    if GLOBALSTATS.money <0 then
        MYSTATE.setState('game_over')
    end
end
return funcs



