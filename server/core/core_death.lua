function _player_respawn(user_id, count_heal)
    local player = _player_get_identifier(user_id)
    MySQL.Sync.execute("UPDATE player_account SET player_health = @player_health WHERE player_identifier=@player_identifier", { ['@player_identifier'] = player, ['@player_health'] = count_heal })
    TriggerClientEvent('fivem_roleplay_core:revive', user_id, count_heal)

    if fivem_roleplay_core._display_logs == true then
        print('' .. _L("revive") .. ' : | '..player..' ' .. _L("health") .. ' '..count_heal)
    end

end