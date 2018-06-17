local alreadyDead = false


AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:spawnPlayer()
    Citizen.Wait(2500)
    exports.spawnmanager:setAutoSpawn(false)
    Citizen.Trace("" .. fivem_roleplay_core._sufix .. ": auto-respawn disabled.")
end)


RegisterNetEvent('fivem_roleplay_core:revive')
AddEventHandler('fivem_roleplay_core:revive', function(count_heal)
    local ped = GetPlayerPed(-1)
    local fullHealth = count_heal
    local playerPos = GetEntityCoords(ped, true)
    SetEntityHealth(ped, fullHealth)
    NetworkResurrectLocalPlayer(playerPos, true, true, false)
    ClearPedBloodDamage(ped)
    Citizen.Wait(1)
    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
    Citizen.Wait(1)
    SetEntityHealth(ped, fullHealth)

    if fivem_roleplay_core._display_logs == true then
        print(''.._L('revive')..' : | '..ped)
    end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = GetPlayerPed(-1)
        if IsEntityDead(playerPed) and not alreadyDead then
            wasted()
            StartScreenEffect('DeathFailOut', 0, false)
            DoScreenFadeOut(3000)
            Citizen.Wait(3000)
            DoScreenFadeIn(3000)
            alreadyDead = true
        end
        if not IsEntityDead(playerPed) then
            alreadyDead = false
            StopScreenEffect('DeathFailOut')
        end
    end
end)

function wasted()
    Citizen.CreateThread(function()
        function Initialize(scaleform)
            local scaleform = RequestScaleformMovie(scaleform)
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end
            PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieFunctionParameterString("~r~WASTED")
            PopScaleformMovieFunctionVoid()
            return scaleform
        end
        scaleform = Initialize("mp_big_message_freemode")
        local temps = 0
        while temps<200 do
            Citizen.Wait(0)
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            temps = temps + 1
        end
    end)
end


