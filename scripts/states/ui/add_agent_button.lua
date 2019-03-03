--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:57
-- To change this template use File | Settings | File Templates.
--

INFOS = {
    pickpocket = {"Pickpocket","Cost = €30", "Salary = €0", "Causes Nuisance"},
    employeet = {"Employeet","Cost = €30", "Salary = €0", "Causes Nuisance"},
    bombthreat = {"Bomb Threat", "Cost = €30", "Salary = €0", "Causes Nuisance"},
    spotter = {"Spotter", "Cost = €30", "Salary = €0", "Causes Nuisance"},
    graffiti = {"Graffiti","Cost = €30", "Salary = €0", "Causes Nuisance"},
    musician = {"Musician","Cost = €30", "Salary = €0", "Causes Nuisance"}
}
RENDERINFO= function (agent_name)
    love.graphics.setColor(0.5,0.5,0.8)
    love.graphics.rectangle("fill", 0, 800, 400, 200)
    love.graphics.setColor(1,1,1)
    for k,v in ipairs(INFOS[agent_name]) do
        love.graphics.print(v, 10, 780+40*k)
    end

end
return function(x,y, agent_name)
    local hovers = false
    local w,h = 50, 50
    return {
        onHover = function(xx,yy)
            hovers = xx>x and xx < x + w and yy > y and yy < y + h
        end,
        draw = function()
            if hovers then

                RENDERINFO(agent_name)
                love.graphics.setColor(1,0,0)


            else love.graphics.setColor(0,1,0) end
            love.graphics.draw(RESOURCES.roles2[agent_name], x,y,0,2,2)
            love.graphics.setColor(1,1,1)
        end,
        mousePressed = function()
            if hovers then
                MOUSEMISSED = false
                UIDATASTATE.PUT({'new_agenttype'}, agent_name)
                MYSTATE.setState('add_agent')
                UIDATASTATE.PUT({ 'station' }, nil)
            end
        end
    }
end