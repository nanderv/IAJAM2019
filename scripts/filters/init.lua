local a = core.filter.add
a("train", { "isTrain" })
a("route", { "isRoute" })
a("station", { "isStation" })
a("line", { "isLine" })
a("ID", {"ID"})

a("spotter", {"isSpotter"})
a("playerCharacter", {"isPlayer"})
a("pawn", {"isPiece"})

a("inMetro", {"_pawn", "action.inMetro"})