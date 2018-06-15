function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function _player_get_identifier(id)
    local identifiers = GetPlayerIdentifiers(id)
    local player = getIdentifiant(identifiers)
    return player
end

function _server_get_player_data_info(id)
    local player = _player_get_identifier(id)
    local info = MySQL.Sync.fetchAll("SELECT * FROM player_account WHERE player_identifier = @identifier", {
        ['@identifier'] = player
    })
    if playerInfoMoney[player] == nil and info[1] ~= nil then
        playerInfoMoney[player] = { ["player_money"] = info[1].player_money, ["player_bank_balance"] = info[1].player_bank_balance, ["player_dirty_money"] = info[1].player_dirty_money }
    end
    return info
end

function _server_get_player_all_money(id)
    local player = _player_get_identifier(id)
    if playerInfoMoney[player] == nil then
        local info = MySQL.Sync.fetchAll("SELECT * FROM player_account WHERE player_identifier = @identifier", {
            ['@identifier'] = player
        })
        playerInfoMoney[player] = { ["player_money"] = info[1].player_money, ["player_bank_balance"] = info[1].player_bank_balance, ["player_dirty_money"] = info[1].player_dirty_money }
    end
    return playerInfoMoney[player]
end

function _server_refrech_player_money(id)
    local player = _player_get_identifier(id)
    local info = MySQL.Sync.fetchAll("SELECT * FROM player_account WHERE player_identifier = @identifier", {
        ['@identifier'] = player
    })
    playerInfoMoney[player].player_money = info[1].player_money
    playerInfoMoney[player].player_bank_balance = info[1].player_bank_balance
    playerInfoMoney[player].player_dirty_money = info[1].player_dirty_money
end

function creation_utilisateur(id)
    local player = _player_get_identifier(id)

    MySQL.Async.execute("INSERT INTO `player_account` (`player_identifier`, `player_group`, `player_permission_level`, `player_money`, `player_bank_balance`,`player_dirty_money`) VALUES (@identifier,'user', '0', @money, @player_bank_balance, @dirtymoney) ", {
        ['@identifier'] = player,
        ['@money'] = tonumber(config.player_money),
        ['@player_bank_balance'] = tonumber(config.player_bank_balance),
        ['@dirtymoney'] = tonumber(config.player_dirty_money)
    })
    playerInfoMoney[player] = { ["money"] = config.player_money, ["player_bank_balance"] = config.player_bank_balance, ["dirtymoney"] = config.player_dirty_money }
end

function _player_remove_money(id, rmv)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_money = tonumber(playerInfoMoney[player].player_money - rmv)
    MySQL.Async.execute("UPDATE player_account SET player_money = player_money - @rmv WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@rmv'] = tonumber(rmv)
    })
    TriggerClientEvent('five_roleplay_core:rmvMoney', id, rmv)
end

function _player_add_money(id, add)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_money = tonumber(playerInfoMoney[player].player_money + add)
    MySQL.Async.execute("UPDATE player_account SET player_money = player_money + @add WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@add'] = tonumber(add)
    })
    TriggerClientEvent('five_roleplay_core:addMoney', id, add)
end

function _player_add_bank_money(id, add)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_bank_balance = tonumber(playerInfoMoney[player].player_bank_balance + add)
    MySQL.Async.execute("UPDATE player_account SET player_bank_balance = player_bank_balance + @add WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@add'] = tonumber(add)
    })
    TriggerClientEvent('five_roleplay_core:addBank', id, add)
end

function _player_remove_bank_money(id, rmv)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_bank_balance = tonumber(playerInfoMoney[player].player_bank_balance - rmv)
    MySQL.Async.execute("UPDATE player_account SET player_bank_balance = player_bank_balance - @rmv WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@rmv'] = tonumber(rmv)
    })
    TriggerClientEvent('five_roleplay_core:rmvBank', id, rmv)
end

function _player_remove_money(id, rmv)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_money = tonumber(playerInfoMoney[player].player_money - rmv)
    MySQL.Async.execute("UPDATE player_account SET player_money = player_money - @rmv WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@rmv'] = tonumber(rmv)
    })
    TriggerClientEvent('five_roleplay_core:rmvDirtyMoney', id, rmv)
end

function _player_remove_dirty_money(id, add)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_dirty_money = tonumber(playerInfoMoney[player].player_dirty_money + add)
    MySQL.Async.execute("UPDATE player_account SET player_dirty_money = player_dirty_money - @add WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@add'] = tonumber(add)
    })
    TriggerClientEvent('five_roleplay_core:rmvDirtyMoney', id, add)
end

function _player_set_dirty_money(id, nb)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_dirty_money = tonumber(nb)
    MySQL.Async.execute("UPDATE player_account SET player_dirty_money = @nb WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@nb'] = tonumber(nb)
    })
    TriggerClientEvent('five_roleplay_core:setDirtyMoney', id, nb)
end

function _player_remove_money_for_bank(id, rmv)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_money = tonumber(playerInfoMoney[player].player_money - rmv)
    playerInfoMoney[player].player_bank_balance = tonumber(playerInfoMoney[player].player_bank_balance + rmv)
    MySQL.Async.execute("UPDATE player_account SET player_bank_balance = player_bank_balance + @rmv, player_money = player_money - @rmv WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@rmv'] = tonumber(rmv)
    })
    TriggerClientEvent('five_roleplay_core:removeMoneyForBank', id, tonumber(rmv))
end

function _player_remove_bank_for_money(id, rmv)
    local player = _player_get_identifier(id)
    playerInfoMoney[player].player_money = tonumber(playerInfoMoney[player].player_money + rmv)
    playerInfoMoney[player].player_bank_balance = tonumber(playerInfoMoney[player].player_bank_balance - rmv)
    MySQL.Async.execute("UPDATE player_account SET player_bank_balance = player_bank_balance - @rmv, player_money = player_money + @rmv WHERE player_identifier = @identifier", {
        ['@identifier'] = player,
        ['@rmv'] = tonumber(rmv)
    })
    TriggerClientEvent('five_roleplay_core:removeBankForMoney', id, tonumber(rmv))
end

function change_status_wanted_ia(arg)
    local source = source
    TriggerClientEvent('five_roleplay_core:change_status', source, true)

    if fivem_roleplay_core._display_logs == true then
        print('Changement du comportement des IA policier')
    end

end

function save_player_position(LastPosX, LastPosY, LastPosZ, LastPosH)
    TriggerEvent('five_roleplay_core:save_position', LastPosX, LastPosY, LastPosZ, LastPosH)

end

function update_player_life(arg)
    TriggerEvent('five_roleplay_core:update', arg)
end