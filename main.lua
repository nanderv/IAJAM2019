pprint = require 'lib.pprint'
require 'lib.helpers.core_funcs'
require 'lib.ECFS'
require 'lib.load_all_scripts'
local state = require 'lib.UI.handling'
MYSTATE = state
require 'lib.UI.ui_data_state'
local gamera = require 'lib.gamera'
CAM = gamera.new(-200, -200, 9600, 9600)
font = love.graphics.newFont(32)

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

BONUSES = {
    { 10, 100 },
    { 100, 100 },
    { 300, 100 },
    { 500, 200 },
    { 700, 200 }
}
COSTSPERUNIT = {
    pickpocket = { 10, 7 },
    employeet = { 100000, 100000 },
    bombthreat = { 30, 19 },
    spotter = { 1, 1 },
    graffiti = { 5, 3 },
    musician = { 3, 2 },
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
    money = 100,
    crime = 0,
    goal = 1000,
    lastBonus = 0,
}
function LOADASSETS()
    RESOURCES.station = {}
    RESOURCES.diamond = {}
    RESOURCES.roles = {}
    RESOURCES.roles2 = {}
    RESOURCES.action = {}
    RESOURCES.startScreen = love.graphics.newImage('assets/processed/u6l1@4x.png')
    RESOURCES.winScreen = love.graphics.newImage('assets/processed/u8l1@4x.png')
    RESOURCES.lossScreen = love.graphics.newImage('assets/processed/u7l1@4x.png')
    RESOURCES.wagon = {}
    RESOURCES.wagon2 = {}
    RESOURCES.wagon3 = {}
    RESOURCES.skipButton = love.graphics.newImage('assets/processed/u1m1@16x.png')
    RESOURCES.playButton = love.graphics.newImage('assets/processed/u2m1@16x.png')
    RESOURCES.arrested = love.graphics.newImage('assets/processed/u3m1@16x.png')
    RESOURCES.cleaned = love.graphics.newImage('assets/processed/u4m1@16x.png')
    RESOURCES.music = love.audio.newSource('assets/Music/Electric Underground.ogg', 'stream')
    RESOURCES.soundEffects = {}


    RESOURCES.colours = {
        r = { r = 237, g = 85, b = 59 },
        y = { r = 242, g = 177, b = 52 },
        g = { r = 71, g = 171, b = 108 },
        c = { r = 8, g = 148, b = 161 },
        b = { r = 17, g = 47, b = 65 }
    }
    for k, v in pairs(RESOURCES.colours) do
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
    for k, v in ipairs(colours) do
        RESOURCES.wagon[v] = love.graphics.newImage('assets/processed/w1' .. v .. '@16x.png')
    end
    for k, v in ipairs(colours) do
        RESOURCES.wagon2[v] = love.graphics.newImage('assets/processed/w2' .. v .. '@16x.png')
    end
    for k, v in ipairs(colours) do
        RESOURCES.wagon3[v] = love.graphics.newImage('assets/processed/w3' .. v .. '@16x.png')
    end
    RESOURCES.soundEffects[roles[1]] = love.audio.newSource('assets/Music/Police_sirens.ogg', 'stream')
    RESOURCES.soundEffects[roles[2]] = love.audio.newSource('assets/Music/Pickpocket.ogg', 'stream')
    RESOURCES.soundEffects[roles[4]] = love.audio.newSource('assets/Music/Bombthreat.ogg', 'stream')
    RESOURCES.soundEffects[roles[5]] = love.audio.newSource('assets/Music/Trainspotter.ogg', 'stream')
    RESOURCES.soundEffects['dragging'] = love.audio.newSource('assets/Music/Dragging.ogg', 'stream')
    RESOURCES.soundEffects['metro_moving'] = love.audio.newSource('assets/Music/Metro_moving.ogg', 'stream')
    RESOURCES.soundEffects['coindrop'] = love.audio.newSource('assets/Music/Coindrop.ogg', 'stream')
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
    state.addState("load_menu", scripts.states.load_menu())
    state.addState("game_over", scripts.states.game_lost())
    state.addState("victory", scripts.states.game_won())
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    require 'scripts'
    addStates()
    UIDATASTATE.PUT({ "scrol" }, { x = 0, y = 0, zoom = 1 })
    UIDATASTATE.PUT({ "map" }, "map1")
    CAM:setScale(0.01)
    love.graphics.setFont(font)

    state.setState("load_menu")

    RESOURCES.music:setLooping(true)
    RESOURCES.music:play()
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
    print(MYSTATE.currentState)
    if (MYSTATE.currentState ~= "load_menu") then
        love.graphics.setColor(0, 0, 0.7)
        love.graphics.rectangle("fill", 0, 0, 2000, 50)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("€ " .. tostring(GLOBALSTATS.money), 10, 10)
        love.graphics.print("CRIME = " .. tostring(GLOBALSTATS.crime) .. "OF " .. tostring(GLOBALSTATS.goal), 300, 10)

        local bonus;
        for k, v in ipairs(BONUSES) do
            if v[1] > GLOBALSTATS.crime then
                bonus = v
                break
            end
        end
        if bonus then
            love.graphics.print("Next bonus: € " .. tostring(bonus[2]) .. " at CRIME = " .. bonus[1], 700, 10)
        end
    end
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

