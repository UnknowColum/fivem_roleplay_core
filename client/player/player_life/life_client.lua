local updated = 0
local respawnHospital = false

RegisterNetEvent('five_roleplay_core:setHealth')
AddEventHandler('five_roleplay_core:setHealth', function(result)
    Citizen.Wait(3000)
    SetEntityHealth(PlayerPedId(),result)
end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent('five_roleplay_core:spawn')
end)

function check_player()
    local ped = PlayerId()
    if IsPlayerDead(ped) then
        PlayerResurected = false
    else
        PlayerResurected = true
    end
end

function resetvariable()
    updated = 0
    PlayerResurected = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerId()
        if IsPlayerDead(ped) then
            check_player()
            PlayerResurected = false
        end
        if IsPlayerDead(ped) and updated == 0 then
            TriggerServerEvent('five_roleplay_core:update', GetEntityHealth(ped))
            updated = 1
            print('Personnage mort ' .. GetEntityHealth(ped))
        elseif not IsPlayerDead(ped) and updated == 1 then
            resetvariable()
            PlayerResurected = false
            if not respawnHospital then
                TriggerServerEvent('five_roleplay_core:update', 0)
                Citizen.Wait(1000)
                SetEntityHealth(PlayerPedId(),101)
                Citizen.Wait(10000)
                TriggerServerEvent('five_roleplay_core:update', 0)
                respawnHospital = false
            end
            updated = 0
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        local ped = PlayerPedId()
        if updated == 0 then
            TriggerServerEvent('five_roleplay_core:update', GetEntityHealth(ped))
        end
    end
end)