Citizen.CreateThread(function()
    function _fivem_roleplay_core_checker(err, response, headers)
        local data = json.decode(response)
        local get_data_file = LoadResourceFile(GetCurrentResourceName(), "version.json")
        local version_json = json.decode(get_data_file).version
        if tostring(version_json) ~= tostring(data.version) and tostring(version_json) < tostring(data.version) then
            print("--------------------------------------------------------------------------")
            print('' .. _L("startup") .. '')
            print("https://github.com/iTexZoz/fivem_roleplay_core/releases")
            print('' .. _L("startup2") .. ' | ' .. version_json .. ', ' .. _L("startup3") .. ' | ' .. data.version .. '')
            print('' .. _L("settings") .. ' | ' .. tostring(fivem_roleplay_core._pvp_status) .. '')
            print('' .. _L("settings2") .. ' | ' .. tostring(fivem_roleplay_core._wanted_ia) .. '')
            print("--------------------------------------------------------------------------")
        elseif tostring(version_json) > tostring(data.version) then
            print("--------------------------------------------------------------------------")
            print('' .. _L("startup5") .. '')
            print("--------------------------------------------------------------------------")
        else
            print("--------------------------------------------------------------------------")
            print('' .. _L("startup5") .. '')
            print('' .. _L("startup2") .. ' | ' .. data.version .. '')
            print('' .. _L("settings") .. ' | ' .. tostring(fivem_roleplay_core._pvp_status) .. '')
            print('' .. _L("settings2") .. ' | ' .. tostring(fivem_roleplay_core._wanted_ia) .. '')
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