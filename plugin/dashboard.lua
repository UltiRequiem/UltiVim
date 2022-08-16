local db = require "dashboard"

db.custom_header = {
        '██╗░░░██╗██╗░░░░░████████╗██╗██╗░░░██╗██╗███╗░░░███╗',
        '██║░░░██║██║░░░░░╚══██╔══╝██║██║░░░██║██║████╗░████║',
        '██║░░░██║██║░░░░░░░░██║░░░██║╚██╗░██╔╝██║██╔████╔██║',
        '██║░░░██║██║░░░░░░░░██║░░░██║░╚████╔╝░██║██║╚██╔╝██║',
        '╚██████╔╝███████╗░░░██║░░░██║░░╚██╔╝░░██║██║░╚═╝░██║',
        '░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝',
}

db.custom_center = {
        {icon = '  ',
                desc = 'Recently opened files                   ',
                action =  'Telescope oldfiles',
        },
        {icon = '  ',
                desc = 'Find  File                              ',
                action = 'Telescope find_files find_command=rg,--hidden,--files',
        },
        {icon = '  ',
                desc ='File Browser                            ',
                action =  'Telescope file_browser',
        },
        {icon = '  ',
                desc = 'Find  word                              ',
                action = 'Telescope live_grep',
        },
}


db.custom_footer = {
        'Gureto desu yo, koitsu wa.',
}

db.header_pad = 3
db.center_pad = 3
db.footer_pad = 3
