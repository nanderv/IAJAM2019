--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 01/03/2019
-- Time: 20:29
-- To change this template use File | Settings | File Templates.
--

return function(station, spot, action)
    return  {
        isPolice = true,
        isPiece = "police",
        spot = spot,
        station = station,
        action = action,
    }

end

