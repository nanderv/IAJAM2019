pprint = require 'lib.pprint'
require 'lib.helpers.core_funcs'
require 'lib.ECFS'
require 'lib.load_all_scripts'
local state = require 'lib.UI.state'

function addStates()
    print( scripts.states.testPage())
    state.addState("menu", scripts.states.testPage())
    state.addState("subMenu", {prevState= "menu"})
end
function love.load()
    require 'scripts'
    addStates()
    local station_1, i1 = scripts.entities.station(50,100, "west", 3, 3)
    local station_2, i2 = scripts.entities.station(350,400, "centraal", 3, 3)
    local station_3, i3 = scripts.entities.station(650,100, "oost", 3, 3)

    core.entity.add(station_1)
    core.entity.add(station_2)
    core.entity.add(station_3)
    local route_1, r1 = scripts.entities.route(i1, i2)
    local route_2, r2 = scripts.entities.route(i2, i3)
    local route_3, r3 = scripts.entities.route(i3, i2)
    local route_4, r4 = scripts.entities.route(i2, i1)
    core.entity.add(route_1)
    core.entity.add(route_2)
    core.entity.add(route_3)
    core.entity.add(route_4)
    local line, line_id = scripts.entities.line({r1, r2, r3, r4}, {r=1, g=0, b=0})
    core.entity.add(line)

    local train, t1  = scripts.entities.train(line_id, 1)
    core.entity.add(train)

    local spotter = scripts.entities.spotter(i1, 1, scripts.entities.actions.in_metro(t1))
    core.entity.add(spotter)
    scripts.systems.simulate.move_trains()
    scripts.systems.simulate.move_trains()
    scripts.systems.simulate.move_trains()
    scripts.systems.simulate.move_trains()
    scripts.systems.simulate.move_trains()
    scripts.systems.simulate.move_trains()
end

function love.update(dt)
    state.update(dt)
end

function love.draw()
    state.draw()
    core.run("station", scripts.render.station)
    core.run("route", scripts.render.route)
end

function love.mousepressed( x, y, button )
    state.mousePressed(x,y, button)
end
function love.keypressed( key, scancode, isrepeat )
    state.keypressed( key, scancode, isrepeat )
end