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
            -- Pas d'information player_heath trouvez via steam_id
        else
            local resultat = tonumber(result[1].player_health)
            TriggerClientEvent('five_roleplay_core:setHealth', source, resultat) -- Set point de vie
        end
    end)
end)
RegisterServerEvent('five_roleplay_core:update')
AddEventHandler("five_roleplay_core:update", function(health)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local perso = getIdentifiant(identifiers)
    if health == 0 then
        -- Personnage mort
        --DebugServer('Personnage mort : '..perso)
    else
        -- Personnage pas mort
        --DebugServer('Vie du personnage : '..perso..' - '..health)
    end
    MySQL.Sync.execute("UPDATE player_account SET player_health=@player_health WHERE player_identifier = @username", { ['@player_health'] = health, ['@username'] = perso })
end)