function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

RegisterServerEvent('five_roleplay_core:spawn')
AddEventHandler('five_roleplay_core:spawn', function()
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local perso = getIdentifiant(identifiers)
    MySQL.Async.fetchAll("SELECT * FROM player_account WHERE player_identifier = @name", { ['@name'] = perso }, function(result)
        if result[1].player_health == nil then

            if fivem_roleplay_core._display_logs == true then
                print('' .. _L("no_player_health") .. '')
            end

        else
            local resultat = tonumber(result[1].player_health)
            TriggerClientEvent('five_roleplay_core:setHealth', source, resultat) -- Set point de vie

            if fivem_roleplay_core._display_logs == true then
                print('Setup : | ' .. _L("health") .. ' ' .. resultat .. ' ' .. _L("user") .. ' ' .. perso)
            end
        end
    end)
end)
RegisterServerEvent('five_roleplay_core:update')
AddEventHandler("five_roleplay_core:update", function(health)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local perso = getIdentifiant(identifiers)
    if health == 0 then
        if fivem_roleplay_core._display_logs == true then
            print('' .. _L("user") .. ' : | ' .. _L("death") .. ' ' .. perso)
        end
    else
        if fivem_roleplay_core._display_logs == true then
            print('' .. _L("user_health") .. ' | ' .. perso .. ' - ' .. health)
        end
    end
    MySQL.Sync.execute("UPDATE player_account SET player_health=@player_health WHERE player_identifier = @username", { ['@player_health'] = health, ['@username'] = perso })
end)