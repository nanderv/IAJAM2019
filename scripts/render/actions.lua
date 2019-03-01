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
     newSteps[#newSteps + 1] = {timeLeft = dt, funct = funct}
end
renderer.update = function(dt)
    local step = steps[counter]
    step.timeLeft = step.timeLeft - dt

    if step.timeLeft < 0 then
        counter = counter + 1
    end

    if(counter > #steps) then
        counter = 1
        steps = newSteps

        return true
    end

    return false
end
renderer.draw = function()
    steps[counter].funct(steps[counter])
end
return renderer

