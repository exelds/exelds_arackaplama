fx_version 'adamant'

game 'gta5'

description 'ExeLds Car Coating Script'

version '1.0.0'

server_scripts {
    'server/main.lua',
	'@mysql-async/lib/MySQL.lua'
}

client_scripts {
    'client/main.lua'
}
