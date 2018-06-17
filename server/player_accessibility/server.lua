function Banned_Message(user_id)
    local Result_MySQL = MySQL.Sync.fetchAll("SELECT * FROM `player_accessibility`  WHERE player_identifier=@player_identifier", {
        ['@player_identifier'] = user_id
    })
    if Result_MySQL and Result_MySQL[1] then
        return ('Bannisement : ' .. Result_MySQL[1].reason .. ' | Expiration : ' .. os.date('%Y-%m-%d %H:%M:%S', Result_MySQL[1].expires) .. '')
    else
        if fivem_roleplay_core._display_logs == true then
            print("!!! File : player_accessibility !!! Open issues on https://github.com/iTexZoz/fivem_roleplay_core/issues !!!")
        end
    end
end

AddEventHandler('playerConnecting', function(playerName, setKickReason)
    local source = source
    local player_identifier = _player_get_identifier(source)
    local MySQL_Data = MySQL.Sync.fetchAll("SELECT * FROM player_accessibility WHERE player_identifier=@player_identifier", { ['@player_identifier'] = player_identifier })
    local MySQL_Data_FetchScalar = MySQL.Sync.fetchScalar("SELECT * FROM player_accessibility  WHERE player_identifier=@player_identifier", { ['@player_identifier'] = player_identifier })

    if MySQL_Data_FetchScalar ~= nil then

        if tonumber(MySQL_Data[1].status) == tonumber(1) or tonumber(MySQL_Data[1].status) < tonumber(1) then

            if fivem_roleplay_core._display_logs == true then
                print('Utilisateur Whitelist, Connexion en cour pour : ' .. playerName)
            end

        end

        if tonumber(MySQL_Data[1].status) == tonumber(2) or tonumber(MySQL_Data[1].status) > tonumber(2) then

            if fivem_roleplay_core._display_logs == true then
                print('Tentative de connexion de l\'utilisateur : | ' .. playerName .. ' Connexion Refusé (Bannisement)')
            end

            setKickReason(Banned_Message(player_identifier))
            CancelEvent()
        end

    else

        if fivem_roleplay_core._whitelist == true then
            setKickReason('vous n\'êtes pas WhiteList sur le serveur, Rejoingez le discord pour plus d\'informations https://discord.gg/xxxxx')
            CancelEvent()
        else
            if fivem_roleplay_core._whitelist == false then
                print(MySQL_Data[1].status)
                if tonumber(MySQL_Data[1].status) == tonumber(2) or tonumber(MySQL_Data[1].status) > tonumber(2) then
                    print('Tentative de connexion de l\'utilisateur : | ' .. playerName .. ' Connexion Refusé (Bannisement)')
                    setKickReason(Banned_Message(player_identifier))
                    CancelEvent()
                end
            end
        end
    end
end)