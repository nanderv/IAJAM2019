pprint = require 'lib.pprint'
require 'lib.helpers.core_funcs'
require 'lib.ECFS'
require 'lib.load_all_scripts'
local state = require 'lib.UI.handling'
MYSTATE = state
require 'lib.UI.ui_data_state'
local gamera = require 'lib.gamera'
CAM = gamera.new(0, 0, 9600, 9600)
font = love.graphics.newFont( 32 )

P = {}
P.agentSize = 40
RESOURCES = {}
local colours = {
    'r',
    'y',
    'g',
    'c',
    'b'
}
COSTSPERUNIT = {
    pickpocket = { 2, 1 },
    employeet = { 2, 1 },
    bombthreat = { 2, 1 },
    spotter = { 2, 1 },
    graffiti = { 2, 1 },
    musician ={ 2, 1 },
}
local roles = {
    'police',
    'pickpocket',
    'employeet',
    'bombthreat',
    'spotter',
    'graffiti',
    'musician'
}

local actions = {
    'delete',
    'hidden',
    'visible',
    'confirm',
}

GLOBALSTATS = {
    money = 1000,
    crime = 0,
}
function LOADASSETS()
    RESOURCES.station = {}
    RESOURCES.diamond = {}
    RESOURCES.roles = {}
    RESOURCES.roles2 = {}
    RESOURCES.action = {}


    RESOURCES.colours = {
        r = { r = 237, g = 85, b = 59},
        y = { r = 242, g = 177, b = 52},
        g = { r = 71, g = 171, b = 108},
        c = { r = 8, g = 148, b = 161},
        b = { r = 17, g = 47, b = 65}
    }
    for k,v in pairs(RESOURCES.colours) do
        v.r = v.r / 255
        v.g = v.g / 255
        v.b = v.b / 255
    end
    for k, v in ipairs(colours) do
        RESOURCES.station[v] = love.graphics.newImage('assets/processed/s1' .. v .. '@16x.png')
    end
    for k, v in ipairs(actions) do
        RESOURCES.action[v] = love.graphics.newImage('assets/processed/a' .. k .. 's2@16x.png')
    end
    for k, v in ipairs(roles) do
        RESOURCES.roles[v] = love.graphics.newImage('assets/processed/p' .. k .. 's1@8x.png')
    end
    for k, v in ipairs(roles) do
        RESOURCES.roles2[v] = love.graphics.newImage('assets/processed/p' .. k .. 's2@16x.png')
    end
    for k, v in ipairs(colours) do
        RESOURCES.diamond[v] = love.graphics.newImage('assets/processed/x1' .. v .. '@16x.png')
    end
    pprint(RESOURCES)
end

function addStates()
    LOADASSETS()
    print(scripts.states.testPage())

    state.addState("base_map_state", scripts.states.base_map_state())
    state.addState("do_turn", scripts.states.do_turn())
    state.addState("do_moving_metro", scripts.states.do_moving_metro())
    state.addState("end_turn", scripts.states.end_turn())
    state.addState("do_police", scripts.states.do_police())
    state.addState("add_agent", scripts.states.add_agent())

    state.addState("load_map", scripts.states.load_map())
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    require 'scripts'
    addStates()
    UIDATASTATE.PUT({ "scrol" }, { x = 0, y = 0, zoom = 1 })
    UIDATASTATE.PUT({ "map" }, "map1")
    CAM:setScale(0.01)
    love.graphics.setFont(font)

    state.setState("load_map")
end

function love.update(dt)
    require("lib.lovebird").update()
    state.update(dt)
end

function love.draw()
    love.graphics.setColor(252 / 255, 233 / 255, 200 / 255)
    love.graphics.rectangle("fill", 0, 0, 10000, 10000)
    love.graphics.setColor(1, 1, 1)
    state.draw()

    love.graphics.print("€ " .. tostring (GLOBALSTATS.money), 10, 10)
end

function love.mousepressed(x, y, button)
    state.mousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
    state.mouseReleased(x, y, button)
end

function love.keypressed(key, scancode, isrepeat)
    state.keypressed(key, scancode, isrepeat)
end

function love.wheelmoved(x, y)
    state.wheelmoved(x, y)
end

