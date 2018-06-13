local function _get_version_fmc()
    local get_data_file = LoadResourceFile(GetCurrentResourceName(), "version.json")
    local version_json = json.decode(get_data_file).version
    return version_json
end

function _start_ressource()
    print("\n")
    print("\n--------------------------------------------------------------------------")
    print('Version : | '.. _get_version_fmc() ..'')
    print('Pvp Status : | '..fivem_roleplay_core._pvp_status..'')
    print('Wanted AI status : | xxxxxxxxxxx')
    print("--------------------------------------------------------------------------")

    print("\n")
    print("\n")
end

    print(PerformHttpRequest("https://raw.githubusercontent.com/Bluethefurry/EasyAdmin/master/version.json", "GET"))
