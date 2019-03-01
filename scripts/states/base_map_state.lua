--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 21:56
-- To change this template use File | Settings | File Templates.
--


return function()
    return {
        draw = function()
            -- draw map background etc.
            core.run("station", scripts.render.station)
            core.run("route", scripts.render.route)
        end,
        update = function(dt)
            local opos = UIDATASTATE.GET({"mouse", ".scrolling"})
            if opos then
                local x, y = love.mouse.getPosition( )
                UIState.put({"scroll"}, {x=x- opos.x, y=y-opos.y})
                UIDATASTATE.PUT({"mouse", ".scrolling"}, {x= x, y= y})
            end
        end,
        selected = nil,
        enter = function() end,
        leave = function() end,
        elements = {
        },
        mouseReleased = function(x, y, button, istouch, presses)
            if(button ==  2) then
                print("RMB up")
                UIDATASTATE.PUT({"mouse", ".scrolling"}, nil)
            end
        end,
        mousepressed = function(x, y, button, istouch, presses)
            if(button ==  2) then
                print("RMB")
                UIDATASTATE.PUT({"mouse", ".scrolling"}, {x= x, y= y})
            end
        end
    }
end