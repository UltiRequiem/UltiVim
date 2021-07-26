return require('packer').startup(function()
    use "wbthomason/packer.nvim"
    use "Pocco81/AutoSave.nvim"
    use {
        'neoclide/coc.nvim',
        branch = 'master',
        run = 'yarn install --frozen-lockfile'
    }
    use 'glepnir/dashboard-nvim'
    use {'phaazon/hop.nvim'}
    use 'b3nj5m1n/kommentary'
    use 'mhartington/oceanic-next'
    use 'hoob3rt/lualine.nvim'
    use {'pangloss/vim-javascript', ft = {"javascript"}, as = "pangloss"}
    use {'MaxMEllon/vim-jsx-pretty', ft = {"javascript"}, as = "jsxpretty"}
    use 'akinsho/nvim-bufferline.lua'
    use {'kyazdani42/nvim-tree.lua', cmd = "NvimTreeToggle"}
    use 'kyazdani42/nvim-web-devicons'
    use 'tpope/vim-surround'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            'nvim-telescope/telescope-fzy-native.nvim'
        }
    }
end)
