RegisterNetEvent('five_roleplay_core:pvp_status')
AddEventHandler('five_roleplay_core:pvp_status', function()

    local server_configuration = MySQL.Sync.fetchAll('SELECT * FROM server_configuration')

    local source = source

    if server_configuration[1].pvp_status == 'true' then
        TriggerClientEvent('five_roleplay_core:pvp_status_true', source)
    else
        TriggerClientEvent('five_roleplay_core:pvp_status_false', source)
    end

end)