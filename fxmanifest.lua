fx_version 'cerulean'

game 'gta5'
author 'Sharky - Cs0ng0r'
description 'Core Script for DeathMatch Servers'
lua54 'yes'

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

shared_scripts {
    'shared/*.lua',
    '@ox_lib/init.lua'
}

dependencies {
    'ox_lib'
}