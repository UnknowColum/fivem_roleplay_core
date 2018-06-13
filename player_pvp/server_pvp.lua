RegisterNetEvent('five_roleplay_core:pvp_status')
AddEventHandler('five_roleplay_core:pvp_status', function()
    local source = source
    if fivem_roleplay_core._pvp_status == 'true' then
        TriggerClientEvent('five_roleplay_core:pvp_status_true', source)
    else
        TriggerClientEvent('five_roleplay_core:pvp_status_false', source)
    end
end)