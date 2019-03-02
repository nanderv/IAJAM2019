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
            CAM:draw(function(l,t,w,h)
                -- draw camera stuff here
                core.run("station", scripts.render.station)
                core.run("route", scripts.render.route)
                core.run("station", scripts.render.render_characters)
            end)

        end,
        update = function(dt)
            local opos = UIDATASTATE.GET({ "mouse", ".scrolling" })
            if opos then
                local x, y = love.mouse.getPosition()
                local xx = UIDATASTATE.GET({ "scrol" })
                xx.x, xx.y = CAM:getPosition()
                local xn, yn = xx.x + math.floor((x - opos.x) * xx.zoom), xx.y + math.floor((y - opos.y) * xx.zoom)

                CAM:setPosition(xn, yn)
                print()
                UIDATASTATE.PUT({ "scrol" }, { x = xn, y = yn , zoom=xx.zoom})
                UIDATASTATE.PUT({ "mouse", ".scrolling" }, { x = x, y = y})
            end
        end,
        selected = nil,
        enter = function() end,
        leave = function() end,
        elements = {},
        mouseReleased = function(x, y, button, istouch, presses)
            if (button == 2) then
                print("RMB up")
                UIDATASTATE.PUT({ "mouse", ".scrolling" }, nil)
            end
        end,
        mousePressed = function(x, y, button, istouch, presses)
            print(button)
            if (button == 2) then
                print("RMB down")
                UIDATASTATE.PUT({ "mouse", ".scrolling" }, { x = x, y = y })
            end
        end,
        wheelmoved = function(x,y, px, py)
            local tx, ty =CAM:toWorld(px,py)
            local scale = math.max(0.5, CAM:getScale() + y / 2)
            CAM:setScale(scale)
            CAM: setPosition(tx, ty)

        end
    }
end