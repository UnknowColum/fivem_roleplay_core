# fivem_roleplay_core
Basic core for create FiveM server
___
# Server Export
dependency MySQL-Async | https://github.com/brouznouf/fivem-mysql-async

import table.sql on you php_my_admin
```lua
exports['five_roleplay_core']:getIdentifier(source) -- Get player identifer where source


local player = exports['five_roleplay_core']:_server_get_player_data_info(source) 
--player[1].colone_name

local get_money = exports['five_roleplay_core']:_server_get_player_all_money(source)
get_money.player_money 
get_money.player_bank_balance 
get_money.player_dirty_money

exports['five_roleplay_core']:_player_remove_money(source,number)

exports['five_roleplay_core']:_player_add_money(source,number)

exports['five_roleplay_core']:_player_add_bank_money(source,number)

exports['five_roleplay_core']:_player_remove_bank_money(source,number)

exports['five_roleplay_core']:_player_remove_money(source,number)

exports['five_roleplay_core']:_player_remove_dirty_money(source,number)

exports['five_roleplay_core']:_player_set_dirty_money(source,number)

exports['five_roleplay_core']:_player_remove_money_for_bank(source,number)

exports['five_roleplay_core']:_player_remove_bank_for_money(source,number)

exports['five_roleplay_core']:save_player_position(source, x, y, z, h)

exports['five_roleplay_core']:update_player_life(source,number)
```
