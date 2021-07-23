-- Grep
vim.g.dashboard_default_executive = 'telescope'

-- Custo Footer
vim.g.dashboard_custom_footer = {'Gureto desu yo, koitsu wa.'}

-- Custom Header
vim.g.dashboard_custom_header = {
    '██╗░░░██╗██╗░░░░░████████╗██╗██╗░░░██╗██╗███╗░░░███╗',
    '██║░░░██║██║░░░░░╚══██╔══╝██║██║░░░██║██║████╗░████║',
    '██║░░░██║██║░░░░░░░░██║░░░██║╚██╗░██╔╝██║██╔████╔██║',
    '██║░░░██║██║░░░░░░░░██║░░░██║░╚████╔╝░██║██║╚██╔╝██║',
    '╚██████╔╝███████╗░░░██║░░░██║░░╚██╔╝░░██║██║░╚═╝░██║',
    '░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝'
}

-- Dashboard Sections
vim.g.dashboard_custom_section = {
    a = {
        description = {'  Find File          '},
        command = 'Telescope find_files'
    },
    b = {
        description = {'  Recently Used Files'},
        command = 'Telescope oldfiles'
    },
    c = {
        description = {'  Find Word          '},
        command = 'Telescope live_grep'
    },
    d = {
        description = {' Change Color sheme  '},
        command = "Telescope colorscheme"
    },
    e = {
        description = {'  Settings           '},
        command = ':e ~/.config/nvim/init.lua'
    }
}
