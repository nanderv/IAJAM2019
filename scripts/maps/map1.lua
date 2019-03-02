--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 10:16
-- To change this template use File | Settings | File Templates.
--

local map = {}
map.name = "tutorial"
map.description = "explains basic things"

map.generate = function()
    local station_1, i1 = scripts.entities.station(550, 100, "west", 3, 3)
    local station_2, i2 = scripts.entities.station(740, 400, "centraal", 3, 3)
    local station_3, i3 = scripts.entities.station(950, 100, "oost", 3, 3)

    core.entity.add(station_1)
    core.entity.add(station_2)
    core.entity.add(station_3)
    local route_1, r1 = scripts.entities.route(i1, i2, { { x = 740, y = 100 } })
    local route_2, r2 = scripts.entities.route(i2, i3)
    local route_3, r3 = scripts.entities.route(i3, i2)
    local route_4, r4 = scripts.entities.route(i2, i1, { { x = 740, y = 100 } })
    core.entity.add(route_1)
    core.entity.add(route_2)
    core.entity.add(route_3)
    core.entity.add(route_4)
    local line, line_id = scripts.entities.line({ r1, r2, r3, r4 }, { r = 1, g = 0, b = 0 })
    core.entity.add(line)

    local train, t1 = scripts.entities.train(line_id, 1)
    core.entity.add(train)

    local train, t1 = scripts.entities.train(line_id, 3)
    core.entity.add(train)
    local spotter = scripts.entities.spotter(i1, 1, {})
    core.entity.add(spotter)
    local police = scripts.entities.spotter(i2, 2, {})
    core.entity.add(police)
    local police = scripts.entities.spotter(i2, 3, {})
    core.entity.add(police)
    local police = scripts.entities.police(i2, scripts.entities.actions.in_metro(t1))
    core.entity.add(police)
    pprint(F.police)
end
return map
