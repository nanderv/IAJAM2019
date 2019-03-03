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

a('pickpocket', {"ispickpocket"})
a('employeet', {"isemployeet"})
a('bombthreat', {"isbombthreat"})
a('spotter', {"isspotter"})
a('graffiti', {"isgraffiti"})
a('musician', {"ismusician"})

a('hiddenpickpocket', {'_pcOnStation', "_pickpocket", 'action.hide'})
a('hiddenemployeet', {'_pcOnStation', "_employeet", 'action.hide'})
a('hiddenbombthreat', {'_pcOnStation', "_bombthreat", 'action.hide'})
a('hiddenspotter', {'_pcOnStation', "_spotter", 'action.hide'})
a('hiddengraffiti', {'_pcOnStation', "_graffiti", 'action.hide'})
a('hiddenmusician', {'_pcOnStation', "_musician", 'action.hide'})

a('activepickpocket', {'_pcOnStation',"_pickpocket", '-action.hide'})
a('activeemployeet', {'_pcOnStation',"_employeet", '-action.hide'})
a('activebombthreat', {'_pcOnStation',"_bombthreat", '-action.hide'})
a('activespotter', {'_pcOnStation',"_spotter", '-action.hide'})
a('activegraffiti', {'_pcOnStation',"_graffiti", '-action.hide'})
a('activemusician', {'_pcOnStation',"_musician", '-action.hide'})