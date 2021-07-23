return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'neoclide/coc.nvim',
        branch = 'master',
        run = 'yarn install --frozen-lockfile'
    }
    use 'glepnir/dashboard-nvim'
    use 'tpope/vim-fugitive'
    use 'phaazon/hop.nvim'
    use 'b3nj5m1n/kommentary'
    use 'mhartington/oceanic-next'
    use 'hoob3rt/lualine.nvim'
    use 'kyazdani42/nvim-tree.lua'
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
