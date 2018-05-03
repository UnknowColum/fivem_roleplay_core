ui_page('html/index.html')

files({
    'html/index.html',
    'html/js/script.js',
    'html/font/pricedown.ttf',
    'html/css/style.css',
    'html/icons/argent.png',
    'html/icons/argent_sale.png',
    'html/icons/banque.png'
})



server_script {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua', -- five_roleplay_core script
    'server/server_export.lua', -- five_roleplay_core server_export list function
    'wrapper/wrapper_server.lua', -- Warpper server
    'player_position/server_position.lua', -- New User position / Save player position
    'player_pvp/server_pvp.lua', -- Enable / Disable PVP script
}


client_script {
    'client/client.lua', -- five_roleplay_core client
    'wrapper/wrapper_client.lua', -- Warpper client
    'player_position/client_position.lua', -- New User position / Save player position
    'player_position/client_pvp.lua', -- Enable / Disable PVP script
    'player_wanted/client_wanted.lua'  -- Enable / disable IA Coops wanted client
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
