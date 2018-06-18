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


---------------------------------------------------------------
---- DEAD SCREEN
---------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityDead(PlayerPedId())then
            StartScreenEffect("DeathFailOut", 0, 0)
            ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)

            local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

            if HasScaleformMovieLoaded(scaleform) then
                Citizen.Wait(0)

                PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
                BeginTextComponent("STRING")
                AddTextComponentString("~r~Vous êtes dans le coma")
                EndTextComponent()
                PopScaleformMovieFunctionVoid()

                Citizen.Wait(500)

                while IsEntityDead(PlayerPedId()) do
                    DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                    Citizen.Wait(0)
                end

                StopScreenEffect("DeathFailOut")
            end
        end
    end
end)