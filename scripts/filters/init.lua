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

a("connector", {"isConnector"})

a('pickpocket', {"pickpocket"})
a('employeet', {"employeet"})
a('bombthreat', {"bombthreat"})
a('spotter', {"spotter"})
a('graffiti', {"graffiti"})
a('musician', {"musician"})

a('hiddenpickpocket', {"_pickpocket", 'action.hide'})
a('hiddenemployeet', {"_employeet", 'action.hide'})
a('hiddenbombthreat', {"_bombthreat", 'action.hide'})
a('hiddenspotter', {"_spotter", 'action.hide'})
a('hiddengraffiti', {"_graffiti", 'action.hide'})
a('hiddenmusician', {"_musician", 'action.hide'})

a('activepickpocket', {"_pickpocket", '-action.hide'})
a('activeemployeet', {"_employeet", '-action.hide'})
a('activebombthreat', {"_bombthreat", '-action.hide'})
a('activespotter', {"_spotter", '-action.hide'})
a('activegraffiti', {"_graffiti", '-action.hide'})
a('activemusician', {"_musician", '-action.hide'})