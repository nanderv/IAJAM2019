--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:29
-- To change this template use File | Settings | File Templates.
--

return function(station, action)
    local scum_ID = GET_ID()

    return  {
        isPolice = true,
        isPiece = "police",
        station = station,
        action = action,
        ID = scum_ID,
    }, scum_ID

end

