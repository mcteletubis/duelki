ESX = exports['es_extended']:getSharedObject()

local queue = {}
local fights = {}

local function getRandomArena(zone)
    local arenas = Config.Arenas[zone]
    local data = arenas[math.random(1, #arenas)]

    return {name = data.arena_name, coords = data.spawnpoints}
end

local function checkQueue(zone)
    local players = {}

    for player in pairs(queue[zone]) do
        table.insert(players, player)
    end

    if #players >= 2 then
        local randomIndex1 = math.random(1, #players)
        player_one = players[randomIndex1]
        queue[zone][player_one] = nil

        local randomIndex2 = math.random(1, #players - 1)
        if randomIndex2 >= randomIndex1 then
            randomIndex2 = randomIndex2 + 1
        end

        player_two = players[randomIndex2]
        queue[zone][player_two] = nil

        print('player one', player_one)
        print('player two', player_two)

        fights[player_one] = player_two
        fights[player_two] = player_one

        local arena = getRandomArena(zone)

        SetPlayerRoutingBucket(player_one, 10000 + player_one)
        SetPlayerRoutingBucket(player_two, 10000 + player_one)

        TriggerClientEvent("vowkixteletubisduels:Start", player_one, arena.coords[1], GetPlayerName(player_two), player_two)
        TriggerClientEvent("vowkixteletubisduels:Start", player_two, arena.coords[2], GetPlayerName(player_one), player_one)

        Citizen.Wait(5000)

        TriggerClientEvent("vowkixteletubisduels:KolejkaState", player_one, false)
        TriggerClientEvent("vowkixteletubisduels:KolejkaState", player_two, false)
    end
end

RegisterServerEvent("vowkixteletubisduels:Killed")
AddEventHandler("vowkixteletubisduels:Killed", function(zone)
    local src = source
    local coords_zone = Config.Zones[zone].spawn_after_fight

    SetPlayerRoutingBucket(src, 0)
    SetPlayerRoutingBucket(fights[src], 0)

    print('stop', src, fights[src])

    local playerOne = ESX.GetPlayerFromId(player_one)
    local playerTwo = ESX.GetPlayerFromId(player_two)

    -- playerOne.addDuel()
    -- playerTwo.addDuel()

    TriggerClientEvent("vowkixteletubisduels:Stop", src, coords_zone, true)
    TriggerClientEvent("ESX.Scaleform.ShowFreemodeMessage", src, "Przegrałeś arenę z "..GetPlayerName(fights[src]))
    TriggerClientEvent("vowkixteletubisduels:Stop", fights[src], coords_zone, false)
    TriggerClientEvent("vowkixteletubisduels:Win", fights[src], GetPlayerName(src), src)

    fights[src] = nil
end)

RegisterServerEvent("vowkixteletubisduels:Leave")
AddEventHandler("vowkixteletubisduels:Leave", function(zone)
    local src = source
    if fights[src] then
        local coords_zone = Config.Zones[zone].spawn_after_fight

        SetPlayerRoutingBucket(src, 0)
        SetPlayerRoutingBucket(fights[src], 0)

        TriggerClientEvent("vowkixteletubisduels:Stop", src, coords_zone, true)
        TriggerClientEvent("vowkixteletubisduels:Stop", fights[src], coords_zone, false)
        TriggerClientEvent("vowkixteletubisduels:Win", fights[src], GetPlayerName(src), src)

        fights[src] = nil
    end
end)

RegisterServerEvent("vowkixteletubisduels:Join")
AddEventHandler("vowkixteletubisduels:Join", function(zone)
    local src = source

    if not queue[zone] then
        queue[zone] = {}
    end

    if not queue[zone][src] then
        queue[zone][src] = true
        TriggerClientEvent("esx:showNotification", src, "Dołączyłeś do kolejki")
        TriggerClientEvent("vowkixteletubisduels:KolejkaState", src, true)
        checkQueue(zone)
    else
        queue[zone][src] = nil
        TriggerClientEvent("esx:showNotification", src, "Wyszedłeś z kolejki")
        TriggerClientEvent("vowkixteletubisduels:KolejkaState", src, false)
    end
end)

RegisterServerEvent("vowkixteletubisduels:Quit")
AddEventHandler("vowkixteletubisduels:Quit", function(zone)
    local src = source

    if not queue[zone] then
        queue[zone] = {}
    end

    if queue[zone][src] then
        queue[zone][src] = nil
        TriggerClientEvent("vowkixteletubisduels:KolejkaState", src, false)
    end
end)