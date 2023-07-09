ESX = exports['es_extended']:getSharedObject()
local isInFight = false
local isStarting = false
local HasAlreadyEnteredMarker = false
local CurrentZone = nil
local LastZone = nil
local isInKolejka = false
local fightZone = ""

RegisterNetEvent("vowkixteletubisduels:KolejkaState")
AddEventHandler("vowkixteletubisduels:KolejkaState", function(state)
    isInKolejka = state
end)

RegisterCommand('wypierdalajzduelka', function()
    if fightZone ~= "" then
        TriggerServerEvent("vowkixteletubisduels:Leave", fightZone)
    end
end)

function StartLiczenie(name, enemy)
    FreezeEntityPosition(PlayerPedId(), true)
    showFreemodeFight("Pojedynek z ~b~"..name.." ~q~["..enemy.."]", 1)
    FreezeEntityPosition(PlayerPedId(), false)
    isStarting = false
    if isInFight then
        ESX.ShowNotification("Jeżeli chcesz opuścić arenę wpisz /wypierdalajzduelka")
    end
end

function showFreemodeFight(text, id)
    if isInFight then
        ESX.Scaleform.ShowFreemodeMessage('~p~ DUELEK ~r~ START', text, id)
    end
end

function DisableActions()
    DisableControlAction(2, 24, true)
    DisableControlAction(2, 257, true)
    DisableControlAction(2, 25, true)
    DisableControlAction(2, 263, true)
    DisableControlAction(2, 37, true)
    DisableControlAction(2, 40, true)
    DisableControlAction(2, 39, true)
    DisableControlAction(0, 37, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 140, true)
    DisableControlAction(0, 141, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 143, true)
    DisablePlayerFiring(PlayerPedId(), true)
end

RegisterNetEvent("vowkixteletubisduels:Start")
AddEventHandler("vowkixteletubisduels:Start", function(coords, name, enemy)
    isStarting = true
    isInFight = true
    SetEntityCoords(PlayerPedId(), coords)
    StartLiczenie(name, enemy)
end)

RegisterNetEvent("vowkixteletubisduels:Stop")
AddEventHandler("vowkixteletubisduels:Stop", function(coords, dead)
    isInFight = false
    isInKolejka = false
    fightZone = ""

    if dead then
        TriggerEvent("hypex_ambulancejob:hypexrevive", true)
        Wait(1500)
    else
        TriggerEvent("esx_basicneeds:healPlayer")
    end

    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    SetPedCoordsKeepVehicle(ped, coords)
    while not HasCollisionLoadedAroundEntity(ped) do
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        Wait(10)
    end
    FreezeEntityPosition(ped, false)
end)

RegisterNetEvent("vowkixteletubisduels:Win")
AddEventHandler("vowkixteletubisduels:Win", function(name, id)
    ESX.Scaleform.ShowFreemodeMessage('~y~ZWYCIĘSTWO', "Wygrałeś pojedynek z ~q~"..name.."~w~ ["..id.."]!", 5)
end)

AddEventHandler('esx:onPlayerDeath', function()
    if isInFight then
        TriggerServerEvent("vowkixteletubisduels:Killed", fightZone)
    end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov   
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(200, 200, 200, 255)
    SetTextDropshadow(31, 31, 31, 0.5, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords, sleep = GetEntityCoords(PlayerPedId()), true
		for _,v in pairs(Config.Zones) do
			if (#(coords - vec3(v.zone_coords.x, v.zone_coords.y, v.zone_coords.z)) < 25.0) then
				sleep = false
                DrawMarker(23, v.zone_coords.x, v.zone_coords.y, v.zone_coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 51, 204, 51, 125, false, true, 2, nil, nil, false)
                Draw3DText(v.zone_coords.x, v.zone_coords.y, v.zone_coords.z, "~g~Vowki x Teletubis ~w~Duele", 4, 0.1, 0.1)
			end
		end
		if sleep then
			Citizen.Wait(750)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords, sleep = GetEntityCoords(PlayerPedId()), true
		local isInMarker  = false
        local zone = ""
		for _,v in pairs(Config.Zones) do
			if #(coords - vec3(v.zone_coords.x, v.zone_coords.y, v.zone_coords.z)) < 2.5 then
				sleep = false
				isInMarker = true
                fightZone = v.name
                zone = v.name
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
            CurrentZone = zone
            LastZone = zone
            fightZone = zone
		end
		if not isInMarker and HasAlreadyEnteredMarker then
            if isInKolejka then
                TriggerServerEvent("vowkixteletubisduels:Quit", LastZone)
            end
			HasAlreadyEnteredMarker = false
            CurrentZone = nil
		end
		if sleep then
			Citizen.Wait(1000)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentZone ~= nil then
            ESX.ShowHelpNotification("Naciśnij ~INPUT_PICKUP~ aby dołączyć bądź opuścić duela!")
			if IsControlJustReleased(0, 38) then
                TriggerServerEvent("vowkixteletubisduels:Join", CurrentZone)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isStarting then
            DisableActions()
        else
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if isInFight then
            sleep = true
            for _, v in pairs(Config.Arenas) do
                for i = 1, #v, 1 do
                    if #(v[i].arena_marker - GetEntityCoords(PlayerPedId())) < v[i].arena_radius + 10 then
                        sleep = false
                        DrawMarker(28, v[i].arena_marker.x, v[i].arena_marker.y, v[i].arena_marker.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v[i].arena_radius, v[i].arena_radius, v[i].arena_radius, 51, 204, 51, 60, 0, 0, 2, 0, 0, 0, 0)
                        local _, weapon = GetCurrentPedWeapon(PlayerPedId(), true)
                        if Config.BlacklistedWeapons[weapon] then
                            RemoveWeaponFromPed(PlayerPedId(), weapon)
                        end
                    end
                end
            end
            if sleep then
                Wait(500)
                if not IsEntityDead(PlayerPedId()) then
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 20)
                    if GetEntityHealth(PlayerPedId()) == 0 then
                        isInFight = false
                    end
                else
                    isInFight = false
                end
            end
        else
            Wait(500)
        end
    end
end)
