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
    'server/core/server_data_loader.lua', -- Config file
    '@mysql-async/lib/MySQL.lua',
    'server/core/server.lua', -- five_roleplay_core script

    'server/core/core_death.lua', -- Death gestion && hospital respawn systeme

    'server/core/server_export.lua', -- five_roleplay_core server_export list function
    'server/player/player_position/server_position.lua', -- New User position / Save player position
    'server/player/player_pvp/server_pvp.lua', -- Enable / Disable PVP script
    'server/player/player_life/life_server.lua',

    'server/player_accessibility/server.lua',

    'language/language.lua',
    'language/english.lua',
    'language/french.lua'

}

client_script {
    'configuration.lua', -- Config file

    'client/core/client.lua', -- five_roleplay_core client

    'client/notification/client.lua',

    'client/core/core_death.lua', -- Death gestion && hospital respawn systeme

    'client/player/player_position/client_position.lua', -- New User position / Save player position
    'client/player/player_pvp/client_pvp.lua', -- Enable / Disable PVP script
    'client/player/player_wanted/client_wanted.lua', -- Enable / disable IA Coops wanted client
    'client/player/vocal_systeme/vocal_client.lua',
    'client/player/player_life/life_client.lua',
    'client/player/player_crosshair/crosshair_client.lua',
    'client/vehicle/hud/client.lua',

    'language/language.lua',
    'language/english.lua',
    'language/french.lua'

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
    'update_player_life',
    '_player_respawn'
}  
