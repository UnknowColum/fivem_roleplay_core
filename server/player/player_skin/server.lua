-- _player_get_identifier
RegisterServerEvent('fivem_roleplay_core::skin_loader')
AddEventHandler('fivem_roleplay_core::skin_loader', function(id)
    local player = _player_get_identifier(id)
    print(player)
    local player_skin = MySQL.Sync.fetchAll('SELECT * FROM player_skin WHERE player_identifier=@player_identifier', {
        ["@player_identifier"] = player,
    })

    print(player_skin[1].player_data)
end)