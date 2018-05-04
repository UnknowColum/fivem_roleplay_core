ui_page('html/index.html')

files({
    'html/index.html',
    'html/js/script.js',
    'html/font/pricedown.ttf',
    'html/css/style.css'
})

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua', -- five_roleplay_core script
    'server/server_export.lua', -- five_roleplay_core server_export list function
    'wrapper/wrapper_server.lua', -- Warpper server
    'player_position/server_position.lua', -- New User position / Save player position
    'player_pvp/server_pvp.lua', -- Enable / Disable PVP script
    'player_life/life_server.lua'
}


client_script {
    'client/client.lua', -- five_roleplay_core client
    'wrapper/wrapper_client.lua', -- Warpper client
    'player_position/client_position.lua', -- New User position / Save player position
    'player_position/client_pvp.lua', -- Enable / Disable PVP script
    'player_wanted/client_wanted.lua',  -- Enable / disable IA Coops wanted client
    'vocal_systeme/vocal_client.lua',
    'player_life/life_client.lua'
}

server_exports {
    'getIdentifier',
    'getPlayerInfo',
    'getPlayerAllMoney',
    'refreshMoney',
    'removeMoney',
    'AddMoney',
    'addBank',
    'removeBank',
    'removeDirtyMoney',
    'addDirtyMoney',
    'setDirtyMoney',
    'removeMoneyForBank',
    'removeBankForMoney',
    'save_player_position'
}
