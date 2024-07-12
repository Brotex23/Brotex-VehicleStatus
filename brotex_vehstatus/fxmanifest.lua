fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Brotex'
description 'Brotex Vehicle Status'
discord 'brotex.gg/brotexdevelopment'
version '1.0'

shared_scripts {
	'@ox_lib/init.lua',
	'configuration/*.lua',
}

client_scripts {'client/client.lua'}

dependencies {'ox_lib', 'es_extended'}


