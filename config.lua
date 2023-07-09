
Config = {}

Config.Zones = {
    ["Miasto"] = {
        name = "Miasto",
        zone_coords = vec3(720.81848144531, -2035.1511230469, 28.50),
        spawn_after_fight = vec3(725.87231445313, -2030.9743652344, 29.285051345825)
    },
    ["Sandy"] = {
        name = "Sandy",
        zone_coords = vec3(575.56268310547, 2719.9296875, 41.2),
        spawn_after_fight = vec3(578.15765380859, 2725.1799316406, 42.060199737549)
    },
}

Config.Arenas = {
    ["Miasto"] = {
        {
            arena_name = "Spływ",
            arena_marker = vec3(692.13256835938, -1533.7049560547, 9.7086296081543),
            arena_radius = 50.0,
            spawnpoints = {
                [1] = vec3(701.62127685547, -1561.7325439453, 9.7090921401978),
                [2] = vec3(683.75994873047, -1507.4351806641, 9.7087488174438),
            },
        },
        {
            arena_name = "Doki",
            arena_marker = vec3(985.52526855469, -1816.2244873047,31.152809143066),
            arena_radius = 70.0,
            spawnpoints = {
                [1] = vec3(989.6474609375, -1780.4353027344, 31.295679092407),
                [2] = vec3(983.29357910156, -1856.1530761719, 31.084150314331),
            },
        },
        {
            arena_name = "Domki Mirror",
            arena_marker = vec3(1364.3092041016, -575.95617675781, 74.380348205566),
            arena_radius = 70.0,
            spawnpoints = {
                [1] = vec3(1378.5372314453, -596.13305664063, 74.337928771973),
                [2] = vec3(1353.9163818359, -554.20190429688, 74.096611022949),
            },
        },
        {
            arena_name = "Grochy",
            arena_marker = vec3(-129.37339782715, -1622.9903564453, 32.104557037354),
            arena_radius = 70.0,
            spawnpoints = {
                [1] = vec3(-166.17880249023, -1667.2805175781, 32.99556350708),
                [2] = vec3(-94.95825958252, -1582.4670410156, 31.291015625),
            },
        },
        {
            arena_name = "doki",
            arena_marker = vec3(-218.80104064941, -2633.8234863281, 6.0103969573975),
            arena_radius = 100.0,
            spawnpoints = {
                [1] = vec3(-221.42597961426, -2653.2368164063, 6.0002980232239),
                [2] = vec3(-184.26838684082, -2629.7255859375, 6.0081715583801),
            },
        },
        {
            arena_name = "Dach",
            arena_marker = vec3(188.00523376465, 256.48934936523, 141.47811889648),
            arena_radius = 60.0,
            spawnpoints = {
                [1] = vec3(178.75122070313, 230.89845275879, 141.47811889648), 
                [2] = vec3(200.91896057129, 287.46185302734, 141.47811889648),
            },
        },
    },
    ["Sandy"] = {
        {
            arena_name = "Kościół",
            arena_marker = vec3(-316.47750854492, 2810.3937988281, 72.281204223633),
            arena_radius = 80.0,
            spawnpoints = {
                [1] = vec3(-288.58285522461, 2847.3088378906, 54.381378173828),
                [2] = vec3(-333.83996582031, 2783.3830566406, 60.00256729126),
            },
        },
        {
            arena_name = "Farma",
            arena_marker = vec3(-99.9677734375, 1917.2052001953, 196.75564575195),
            arena_radius = 80.0,
            spawnpoints = {
                [1] = vec3(-121.47826385498, 1926.6422119141, 197.04425048828),
                [2] = vec3(-78.011436462402, 1912.9340820313, 196.48533630371),
            },
        },
        {
            arena_name = "Domki",
            arena_marker = vec3(-480.0549621582, 6279.0927734375, 13.398541450),
            arena_radius = 70.0,
            spawnpoints = {
                [1] = vec3(-472.47134399414, 6296.6127929688, 13.711937904358),
                [2] = vec3(-487.14370727539, 6261.4453125, 12.71658039093),
            },
        },
        {
            arena_name = "Domy",
            arena_marker = vec3(736.28546142578, 4184.3540039063, 40.631271362305),
            arena_radius = 100.0,
            spawnpoints = {
                [1] = vec3(690.98211669922, 4189.9477539063, 41.82487487793),
                [2] = vec3(773.46221923828, 4170.72265625, 40.674900054932),
            },
        },
    },
}

Config.BlacklistedWeapons = {
    [584646201] = 'WEAPON_APPISTOL',
    [911657153] = 'WEAPON_STUNGUN',
    [1198879012] = 'WEAPON_FLAREGUN',
    [324215364] = 'WEAPON_MICROSMG',
    [-619010992] = 'WEAPON_MACHINEPISTOL',
	[736523883] = 'WEAPON_SMG',
    [2024373456] = 'WEAPON_SMG_MK2',
    [-270015777] = 'WEAPON_ASSAULTSMG',
    [171789620] = 'WEAPON_COMBATPDW',
    [-1660422300] = 'WEAPON_MG',
    [2144741730] = 'WEAPON_COMBATMG',
	[3686625920] = 'WEAPON_COMBATMG_MK2',
    [1627465347] = 'WEAPON_GUSENBERG',
    [-1121678507] = 'WEAPON_MINISMG',
    [-1074790547] = 'WEAPON_ASSAULTRIFLE',
    [961495388] = 'WEAPON_ASSAULTRIFLE_MK2',
    [-2084633992] = 'WEAPON_CARBINERIFLE',
	[4208062921] = 'WEAPON_CARBINERIFLE_MK2',
    [-1357824103] = 'WEAPON_ADVANCEDRIFLE',
    [-1063057011] = 'WEAPON_SPECIALCARBINE',
    [2132975508] = 'WEAPON_BULLPUPRIFLE',
    [1649403952] = 'WEAPON_COMPACTRIFLE',
	[100416529] = 'WEAPON_SNIPERRIFLE',
    [205991906] = 'WEAPON_HEAVYSNIPER',
    [177293209] = 'WEAPON_HEAVYSNIPER_MK2',
    [-952879014] = 'WEAPON_MARKSMANRIFLE',
    [487013001] = 'WEAPON_PUMPSHOTGUN',
    [2017895192] = 'WEAPON_SAWNOFFSHOTGUN',
	[-1654528753] = 'WEAPON_BULLPUPSHOTGUN',
    [-494615257] = 'WEAPON_ASSAULTSHOTGUN',
    [-1466123874] = 'WEAPON_MUSKET',
    [984333226] = 'WEAPON_HEAVYSHOTGUN',
    [-275439685] = 'WEAPON_DOUBLEBARRELSHOTGUN',
    [317205821] = 'WEAPON_AUTOSHOTGUN',
	[-1568386805] = 'WEAPON_GRENADELAUNCHER',
    [-1312131151] = 'WEAPON_RPG',
    [1119849093] = 'WEAPON_MINIGUN',
    [2138347493] = 'WEAPON_FIREWORK',
    [1834241177] = 'WEAPON_RAILGUN',
    [1672152130] = 'WEAPON_HOMINGLAUNCHER',
	[1305664598] = 'WEAPON_GRENADELAUNCHERSMOKE',
    [125959754] = 'WEAPON_COMPACTLAUNCHER',
    [-1813897027] = 'WEAPON_GRENADE',
    [741814745] = 'WEAPON_STICKYBOMB',
    [-1420407917] = 'WEAPON_PROXIMITYMINE',
    [-1600701090] = 'WEAPON_BZGAS',
	[615608432] = 'WEAPON_MOLOTOV',
    [101631238] = 'WEAPON_FIREEXTINGUISHER',
    [883325847] = 'WEAPON_PETROLCAN',
    [1233104067] = 'WEAPON_FLARE',
    [600439132] = 'WEAPON_BALL',
    [126349499] = 'WEAPON_SNOWBALL',
    [-37975472] = 'WEAPON_SMOKEGRENADE',
    [-1169823560] = 'WEAPON_PIPEBOMB',
    [-1045183535] = 'WEAPON_REVOLVER',
    [-879347409] = 'WEAPON_REVOLVER_MK2',
}