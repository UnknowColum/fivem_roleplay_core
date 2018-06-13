ui_page('html/index.html')

files({
    'html/index.html',
    'html/js/script.js',
    'html/font/pricedown.ttf',
    'html/css/style.css'
})

server_script {
    'configuration.lua', -- Config file
    'version',
    'server/server_data_loader.lua', -- Config file
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua', -- five_roleplay_core script
    'server/server_export.lua', -- five_roleplay_core server_export list function
    'player_position/server_position.lua', -- New User position / Save player position
    'player_pvp/server_pvp.lua', -- Enable / Disable PVP script
    'player_life/life_server.lua'
}

client_script {
    'configuration.lua', -- Config file
    'client/client.lua', -- five_roleplay_core client
    'player_position/client_position.lua', -- New User position / Save player position
    'player_pvp/client_pvp.lua', -- Enable / Disable PVP script
    'player_wanted/client_wanted.lua',  -- Enable / disable IA Coops wanted client
    'vocal_systeme/vocal_client.lua',
    'player_life/life_client.lua',
    'player_crosshair/crosshair_client.lua'
}

server_exports {
    'getIdentifier',
    '_server_get_player_data_info',
    '_server_get_player_all_money',
    '_server_refrech_player_money',
    '_player_remove_money',
    '_player_add_money',
    '_player_add_bank_money',
    '_player_remove_bank_money',
    '_player_remove_money',
    '_player_remove_dirty_money',
    '_player_set_dirty_money',
    '_player_remove_money_for_bank',
    '_player_remove_bank_for_money',
    'save_player_position',
    'update_player_life'
}  
