local debug_server = true

AddEventHandler('onMySQLReady', function()
    config = {
        player_money = fivem_roleplay_core._default_player_money,
        player_bank_balance = fivem_roleplay_core._default_player_bank_balance,
        player_dirty_money = fivem_roleplay_core._default_player_dirty_money
    }
end)

playerInfoMoney = {}

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dumpinitializeinfo(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

RegisterServerEvent('five_roleplay_core:spawn')
AddEventHandler('five_roleplay_core:spawn', function()
    local source = source
    local player = _server_get_player_data_info(source)
    if player[1] ~= nil then
        TriggerClientEvent('five_roleplay_core:initializeinfo', source, player[1].player_money, player[1].player_dirty_money, player[1].player_bank_balance)
    end
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason)
    local source = source
    local player = _server_get_player_data_info(source)
    if player[1] == nil then
        creation_utilisateur(source)

        if fivem_roleplay_core._display_logs == true then
            print('Nouvelle utilisateur : | '..source..'')
        end

    end
end)

