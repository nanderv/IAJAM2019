--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:55
-- To change this template use File | Settings | File Templates.
--

local renderer = {}
local steps = {}
local newSteps = {}

renderer.counter = 1
renderer.add  = function(dt, funct, initialize)
     newSteps[#newSteps + 1] = {otime = dt, timeLeft = dt, funct = funct, initialize = initialize}
end
local initialized = true
renderer.switch = function()
    renderer.counter = 1
    steps = newSteps
    initialized = false
    newSteps = {}
end
renderer.update = function(dt)
    local step = steps[renderer.counter]
    if not step then
        return false
    end
    if not initialized and steps[renderer.counter].initialize then
        steps[renderer.counter].initialize()
        initialized = true
    end
    step.timeLeft = step.timeLeft - dt

    if step.timeLeft < 0 then
        renderer.counter = renderer.counter + 1
        initialized = false
    end
    step = steps[renderer.counter]

    if not step then
        return false
    end


    return true
end
renderer.draw = function()

    if not steps[renderer.counter] then return end

    if not initialized and steps[renderer.counter].initialize then
        steps[renderer.counter].initialize()
        initialized = true
    end
    steps[renderer.counter].funct(steps[renderer.counter])
end
return renderer

