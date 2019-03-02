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
    local station_1, i1 = scripts.entities.station(2000, 200, "west", 3, 3,nil,nil, 'r')
    local station_2, i2 = scripts.entities.station(2400, 800, "centraal", 3, 3,nil,nil, 'r')
    local station_4, i4 = scripts.entities.station(2400, 1200, "centraal", 3, 3,nil,nil, 'g')

    local station_3, i3 = scripts.entities.station(3000, 200, "oost", 3, 3,nil,nil, 'r')

    core.entity.add(station_1)
    core.entity.add(station_2)
    core.entity.add(station_3)
    core.entity.add(station_4)
    core.entity.add(scripts.entities.connector(i2,i4))
    local route_1, r1 = scripts.entities.route(i1, i2, { { x = 2400, y = 200 } }, 'r')
    local route_2, r2 = scripts.entities.route(i2, i3, nil, 'r')
    local route_3, r3 = scripts.entities.route(i3, i2, nil, 'r')
    local route_4, r4 = scripts.entities.route(i2, i1, { { x = 2400, y = 200 } }, 'r')
    core.entity.add(route_1)
    core.entity.add(route_2)
    core.entity.add(route_3)
    core.entity.add(route_4)
    local line, line_id = scripts.entities.line({ r1, r2, r3, r4 }, { r = 1, g = 0, b = 0 })
    core.entity.add(line)
    local spotter = scripts.entities.spotter(i1, 1, {}, 'spotter')
    core.entity.add(spotter)

    local police = scripts.entities.spotter(i2, 3, {}, 'spotter')
    core.entity.add(police)

    --local train, t1 = scripts.entities.train(line_id, 1)
    --core.entity.add(train)

    local train, t1 = scripts.entities.train(line_id, 3, 3)
    core.entity.add(train)
    local police = scripts.entities.spotter(i2, 1, scripts.entities.actions.in_metro(t1), 'spotter')
    core.entity.add(police)
    local police = scripts.entities.police(i2, {})
    core.entity.add(police)
end
return map
