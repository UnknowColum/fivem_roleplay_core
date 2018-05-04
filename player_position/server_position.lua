
function DebugServer(arg)
    if debug_server == true then
        print(arg)
    end
end

function GetIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function GetIdentifier(id)
    local identifiers = GetPlayerIdentifiers(id)
    local player = GetIdentifiant(identifiers)
    return player
end

RegisterServerEvent("five_roleplay_core:save_position")
AddEventHandler("five_roleplay_core:save_position", function(LastPosX, LastPosY, LastPosZ, LastPosH)
    local source = source
    local player = GetIdentifier(source)
    --Formatage des données en JSON pour intégration dans MySQL.
    local lastPosition = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. ", " .. LastPosH .. "}"
    MySQL.Async.execute("UPDATE player_account SET `player_position` = @player_position WHERE player_identifier = @username", { ['@username'] = player, ['@player_position'] = lastPosition })
    TriggerClientEvent("five_roleplay_core:notification", source, "~g~Position Sauvegardée")
end)

RegisterServerEvent("five_roleplay_core:SpawnPlayer")
AddEventHandler("five_roleplay_core:SpawnPlayer", function()
    local source = source
    --Récupération du SteamID.
    local player = GetIdentifier(source)
    local player_data = MySQL.Sync.fetchAll('SELECT * FROM player_account WHERE player_identifier = @player_identifier', {
        ["@player_identifier"] = player
    })

    DebugServer(player_data[1].player_first_spawn)
    if player_data[1].player_first_spawn == 'first_spawn' then
        MySQL.Async.fetchAll("SELECT * FROM server_configuration WHERE id = @id", { ['@id'] = 1 }, function(result)
            if (result) then
                for k, v in ipairs(result) do
                    if v.player_first_spawn_location ~= "" then
                        -- Décodage des données récupérées
                        DebugServer(v.player_first_spawn_location)
                        local ToSpawnPos = json.decode(v.player_first_spawn_location)
                        local PosX = ToSpawnPos[1]
                        local PosY = ToSpawnPos[2]
                        local PosZ = ToSpawnPos[3]
                        local PosH = ToSpawnPos[4]
                        TriggerClientEvent("five_roleplay_core:spawn_last_position", source, 0, PosX, PosY, PosZ)
                    end
                end
            end
        end)
        MySQL.Async.execute("UPDATE player_account SET player_first_spawn = @player_first_spawn", { ["@player_first_spawn"] = 'not_first_spawn', })
    else
        MySQL.Async.fetchAll("SELECT * FROM player_account WHERE player_identifier = @username", { ['@username'] = player }, function(result)
            if (result) then
                for k, v in ipairs(result) do
                    if v.player_position ~= "" then
                        DebugServer(v.player_position)
                        -- Décodage des données récupérées
                        local ToSpawnPos = json.decode(v.player_position)
                        local PosX = ToSpawnPos[1]
                        local PosY = ToSpawnPos[2]
                        local PosZ = ToSpawnPos[3]
                        local PosH = ToSpawnPos[4]
                        TriggerClientEvent("five_roleplay_core:spawn_last_position", source, 1, PosX, PosY, PosZ)
                    end
                end
            end
        end)
    end
end)