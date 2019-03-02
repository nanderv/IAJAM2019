--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 27/02/2019
-- Time: 09:42
-- To change this template use File | Settings | File Templates.
--

local state = {}
state.gameSpeed = 1
state.isPaused = false
state.currentState = "subMenu"

state.UIStates = {}

state.addState = function(name, myState)
    state.UIStates[name] = myState
end
state.setState = function(str)
    if not state.UIStates[str] then
        error("State "  .. tostring(str) .. " does not exist")
    end
    if state.UIStates[state.currentState] then
        if state.UIStates[state.currentState].leave then
            state.UIStates[state.currentState].leave()
        end
    end
    if state.UIStates[str].enter then
        state.UIStates[str].enter()
    end
    state.currentState = str
end

state.drawState = function(stateName)
    local myState = state.UIStates[stateName]
    if myState.prevState then
        state.drawState(myState.prevState)
    end

    if myState and myState.draw then
        myState.draw(state, myState)
    end

    if myState.elements then
        for k, v in ipairs(myState.elements) do
            if v.draw then
                v.draw(state, myState)
            end
        end
    end
end

state.draw = function()
    state.drawState(state.currentState)
end

state.updateState = function(stateName, dt)
    local myState = state.UIStates[stateName]
    if myState.prevState then
        state.updateState(myState.prevState, dt)
    end

    if myState and myState.update then
        myState.update(dt)
    end
    local myX, myY = love.mouse.getPosition()
    if myState.elements then
        for k, v in ipairs(myState.elements) do
            if v.update then
                v.update(dt)
            end
            if v.onHover then
                v.onHover(myX, myY)
            end
        end
    end
end

state.update = function(dt)
    state.updateState(state.currentState, dt)
end

state.keypressed = function(key, scanCode, isRepeat)
end

state.keyreleased = function(key, scanCode)
end

state.mousePressedState = function(stateName, x, y, button, istouch, presses)
    local myState = state.UIStates[stateName]
    if myState.prevState then
        state.mousePressedState(myState.prevState, x, y, button, istouch, presses)
    end
    if myState.elements then
        for k, v in ipairs(myState.elements) do
            if v.mousePressed then
                v.mousePressed(x, y, button, istouch, presses)
            end
        end
    end
    if myState and myState.mousePressed then
        myState.mousePressed(x, y, button, istouch, presses)
    end

end

state.mouseReleasedState = function(stateName, x, y, button, istouch, presses)
    local myState = state.UIStates[stateName]
    if myState.prevState then
        state.mouseReleasedState(myState.prevState, x, y, button, istouch, presses)
    end

    if myState and myState.mouseReleased then
        myState.mouseReleased(x, y, button, istouch, presses)
    end
    if myState.elements then
        for k, v in ipairs(myState.elements) do
            if v.mouseReleased then
                v.mouseReleased(x, y, button, istouch, presses)
            end
        end
    end
end

state.mousePressed = function(x, y, button, istouch, presses)
    state.mousePressedState(state.currentState, x, y, button, istouch, presses)
end

state.mouseReleased = function(x, y, button, istouch, presses)
    state.mouseReleasedState(state.currentState, x, y, button, istouch, presses)

end


state.wheelMovedState = function(stateName, x, y, px, py)
    local myState = state.UIStates[stateName]
    if myState.prevState then
        state.wheelMovedState(myState.prevState, x, y, px, py)
    end

    if myState and myState.wheelmoved then
        myState.wheelmoved(x, y, px, py)
    end
    if myState.elements then
        for k, v in ipairs(myState.elements) do
            if v.wheelmoved then
                v.wheelmoved(x, y, px, py)
            end
        end
    end
end

state.wheelmoved = function(x, y)
    local px, py = love.mouse.getPosition()
    state.wheelMovedState(state.currentState, x, y, px, py)

end
return state

