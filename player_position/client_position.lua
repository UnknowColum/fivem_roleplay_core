local firstspawn = 0
local loaded = false


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000) --30000
        local LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        local LastPosH = GetEntityHeading(GetPlayerPed(-1))
        TriggerServerEvent("five_roleplay_core:save_position", LastPosX, LastPosY, LastPosZ, LastPosH)
    end
end)

function DebugClient(arg)
    if debug_print == true then
        print(arg)
    end
end

--Event permettant au serveur d'envoyez une notification au joueur
RegisterNetEvent('five_roleplay_core:notification')
AddEventHandler('five_roleplay_core:notification', function(alert)
    Notify(alert)
end)

-- Notification  start
RegisterNetEvent("five_roleplay_core:advenced_notication")
AddEventHandler("five_roleplay_core:advenced_notication", function(icon, sender, title, text)
    Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING");
        AddTextComponentString(text);
        --SetNotificationMessage(icon, icon, true, 9, sender, title, text);
        SetNotificationMessageClanTag(icon, icon, true, 8, sender, title, 0.5, text)
        DrawNotification(false, true);
    end)
end)

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end
-- Notification end

--Event pour le spawn du joueur vers la dernière position connue
RegisterNetEvent("five_roleplay_core:spawn_last_position")
AddEventHandler("five_roleplay_core:spawn_last_position", function(data, PosX, PosY, PosZ)
    if not loaded then
        if data == 0 then
            SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ + 1.0, 1, 0, 0, 1)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            Wait(2500)
            FreezeEntityPosition(GetPlayerPed(-1), false)
            Citizen.Wait(10)
            TriggerEvent('five_roleplay_core:advenced_notication', 'CHAR_PEGASUS_DELIVERY', 'Bienvenue !', false, "")
            Citizen.Wait(10)
            Notify("~b~Bienvenue a vous sur le serveur. Inscrivé vous.")
            PlaySound(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0);
            loaded = true
        else
            SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ + 1.0, 1, 0, 0, 1)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            Wait(2500)
            FreezeEntityPosition(GetPlayerPed(-1), false)
            Notify("~g~Vous avez été replacé à votre ancienne position.")
            PlaySound(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0);
            loaded = true
        end
        DebugClient(data)
        DebugClient(loaded)
    end
end)

AddEventHandler('playerSpawned', function(spawn)
    if firstspawn == 0 then
        TriggerServerEvent("five_roleplay_core:SpawnPlayer")
        firstspawn = 1
    end
end)

