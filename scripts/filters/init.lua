local a = core.filter.add
a("train", { "isTrain" })
a("route", { "isRoute" })
a("station", { "isStation" })
a("line", { "isLine" })
a("ID", {"ID"})

a("police", {"isPolice"})
a("spotter", {"isspotter"})
a("playerCharacter", {"isPlayer"})

a("pcOnStation", {"_playerCharacter", "-action.inMetro"})
a("pcInMetro", {"_playerCharacter", "action.inMetro"})

a("pawn", {"isPiece"})
a("policeOnStation", {"_police", "-action.inMetro"})
a("policeInMetro", {"_police", "action.inMetro"})

a("inMetro", {"_pawn", "action.inMetro"})