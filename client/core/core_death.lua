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
