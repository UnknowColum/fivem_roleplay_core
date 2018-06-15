function _player_respawn(user_id, count_heal)
    local player = _player_get_identifier(user_id)
    -- MySQL Update de la vie du joeur pour qui ne meurt pas au repop
    MySQL.Sync.execute("UPDATE player_account SET player_health = @player_health WHERE player_identifier=@player_identifier", { ['@player_identifier'] = player, ['@player_health'] = count_heal })
    -- Event Heal with ARG
    TriggerClientEvent('fivem_roleplay_core:revive', user_id, count_heal)
end