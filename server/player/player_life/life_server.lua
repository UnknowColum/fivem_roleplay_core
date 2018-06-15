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
                print('aucune information player_health trouvez via l\'identifier')
            end

        else
            local resultat = tonumber(result[1].player_health)
            TriggerClientEvent('five_roleplay_core:setHealth', source, resultat) -- Set point de vie

            if fivem_roleplay_core._display_logs == true then
                print('Setup : | Point de vie ' .. resultat .. ' Utilisateur : ' .. perso)
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
            print('Utilisateur : | Mort '..perso)
        end

    else

        if fivem_roleplay_core._display_logs == true then
         print('Vie de l\'utilisateur : | '..perso..' - '..health)
        end

    end
    MySQL.Sync.execute("UPDATE player_account SET player_health=@player_health WHERE player_identifier = @username", { ['@player_health'] = health, ['@username'] = perso })
end)