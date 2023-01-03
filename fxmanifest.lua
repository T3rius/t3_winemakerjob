fx_version 'adamant'
game 'gta5'
description 'Terius'
lua54 'yes'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'client/main.lua'
}

dependencies {
    'ox_lib'
}
