author 'DukeOfCheese'
description 'Simple script to display highest rank of a user based on Discord roles'
version '1.0'

client_scripts {
    '@ox_lib/init.lua',
}

server_scripts {
    'server/server.lua',
    'config.lua'
}

exports {
    'GetRank'
}

dependencies {
    'ox_lib',
}