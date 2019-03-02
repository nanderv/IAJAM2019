pprint = require 'lib.pprint'
require 'lib.helpers.core_funcs'
require 'lib.ECFS'
require 'lib.load_all_scripts'
local state = require 'lib.UI.handling'
MYSTATE = state
require 'lib.UI.ui_data_state'
local gamera = require 'lib.gamera'
CAM = gamera.new(0,0,4800,4800)
function addStates()
    print( scripts.states.testPage())
    state.addState("subMenu", scripts.states.testPage())
    state.addState("base_map_state", scripts.states.base_map_state())
    state.addState("do_turn", scripts.states.do_turn())
    state.addState("do_moving_metro", scripts.states.do_moving_metro())
    state.addState("do_police", scripts.states.do_police())
    state.addState("load_map", scripts.states.load_map())

end
function love.load()
    love.graphics.setDefaultFilter( 'nearest', 'nearest' )
    require 'scripts'
    addStates()
    UIDATASTATE.PUT({"scrol"}, {x=0, y=0, zoom=1})
    UIDATASTATE.PUT({"map"}, "map1")
    CAM:setScale(0.01)
    state.setState("load_map")

end

function love.update(dt)
    require("lib.lovebird").update()
    state.update(dt)
end

function love.draw()
    state.draw()
end

function love.mousepressed( x, y, button )
    state.mousePressed(x,y, button)
end
function love.mousereleased(x,y, button)
    state.mouseReleased(x,y,button)
end
function love.keypressed( key, scancode, isrepeat )
    state.keypressed( key, scancode, isrepeat )
end

function love.wheelmoved (x,y)
    state.wheelmoved(x,y)
end