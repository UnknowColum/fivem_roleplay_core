config = {
    player_money = 1500,
    player_bank_balance = 1500,
    player_dirty_money = 0
}

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

function test()
    print(dump(config))
end

RegisterServerEvent('five_roleplay_core:spawn')
AddEventHandler('five_roleplay_core:spawn', function()
    local source = source
    local player = getPlayerInfo(source)
    if player[1] ~= nil then
        print('testmoney' .. player[1].player_money)
        TriggerClientEvent('five_roleplay_core:initializeinfo', source, player[1].player_money, player[1].player_dirty_money, player[1].player_bank_balance)
    end
end)


AddEventHandler('playerConnecting', function(playerName, setKickReason)
    local source = source
    local player = getPlayerInfo(source)
    if player[1] == nil then
        createUser(source)
    end
end)

