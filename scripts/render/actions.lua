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

local counter = 1
renderer.add  = function(dt, funct)
     newSteps[#newSteps + 1] = {otime = dt, timeLeft = dt, funct = funct}
end

renderer.switch = function()
    counter = 1
    steps = newSteps
    newSteps = {}
end
renderer.update = function(dt)
    local step = steps[counter]
    if not step then
        return false
    end
    step.timeLeft = step.timeLeft - dt

    if step.timeLeft < 0 then
        counter = counter + 1
    end


    return true
end
renderer.draw = function()

    if not steps[counter] then return end

    steps[counter].funct(steps[counter])
end
return renderer

