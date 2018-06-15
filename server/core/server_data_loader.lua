Citizen.CreateThread(function()
    function _fivem_roleplay_core_checker(err, response, headers)
        local data = json.decode(response)
        local get_data_file = LoadResourceFile(GetCurrentResourceName(), "version.json")
        local version_json = json.decode(get_data_file).version
        if version_json ~= data.version and tonumber(version_json) < tonumber(data.version) then
            print("--------------------------------------------------------------------------")
            print('Votre version ne semble plus à jour. Veuillez vous rendre sur GitHub.com/iTexZoz afin de téléchargé la nouvelle version.')
            print("https://github.com/iTexZoz/fivem_roleplay_core/releases")
            print('Votre version : | ' .. version_json .. ', La nouvelle version : | ' .. data.version .. '')
            print('Pvp Status : | ' .. tostring(fivem_roleplay_core._pvp_status) .. '')
            print('Wanted AI status : | ' .. tostring(fivem_roleplay_core._wanted_ia) .. '')
            print("--------------------------------------------------------------------------")
        elseif tonumber(version_json) > tonumber(data.version) then
            print("--------------------------------------------------------------------------")
            print("     Votre version semble être plus élevée que la version actuelle.")
            print("--------------------------------------------------------------------------")
        else
            print("--------------------------------------------------------------------------")
            print('Vous procède la dernière version de fivem_roleplay_core.')
            print('Version : | ' .. data.version .. '')
            print('Pvp Status : | ' .. tostring(fivem_roleplay_core._pvp_status) .. '')
            print('Wanted AI status : | ' .. tostring(fivem_roleplay_core._wanted_ia) .. '')
            print("--------------------------------------------------------------------------")
        end
        SetTimeout(600000, _request_check_fivem_core_http)
    end

    -- while tcheck update ect...
    function _request_check_fivem_core_http()
        PerformHttpRequest("https://raw.githubusercontent.com/iTexZoz/fivem_roleplay_core/master/version.json", _fivem_roleplay_core_checker, "GET")
    end

    -- call function PerformHttpRequest
    _request_check_fivem_core_http()
end)