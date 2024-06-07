fx_version 'cerulean'
game 'gta5' 
lua54 'yes'

author 'YODDA THINGS'
description 'Combine items with ox_inventory'
version '1.0'

server_scripts {
	'server.lua'
}

client_scripts {
	'client.lua'
}


dependencies { 'ox_lib', 'ox_inventory'}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}
