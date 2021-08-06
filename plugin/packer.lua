return require('packer').startup(function(use)
    -- Packer Itself
    use "wbthomason/packer.nvim"

    -- LSP Provider
    use {
        'neoclide/coc.nvim',
        branch = 'master',
        run = 'yarn install --frozen-lockfile'
    }

    -- Utilities
    use 'phaazon/hop.nvim'
    use "Pocco81/AutoSave.nvim"
    use 'tpope/vim-surround'
    use 'b3nj5m1n/kommentary'
    use {'nacro90/numb.nvim', config = require('numb').setup()}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            'nvim-telescope/telescope-fzy-native.nvim'
        }
    }

    -- Syntax Highlighting
    use {'pangloss/vim-javascript', ft = {"javascript"}, as = "pangloss"}
    use {
        'HerringtonDarkholme/yats.vim',
        ft = {"typescript", "typescriptreact", as = "yats"}
    }
    use {
        'MaxMEllon/vim-jsx-pretty',
        ft = {"javascriptreact", "typescriptreact"},
        as = "jsxpretty"
    }

    -- UI Plugins
    use 'glepnir/dashboard-nvim'
    use 'hoob3rt/lualine.nvim'
    use 'akinsho/nvim-bufferline.lua'
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- Themes
    use {'mhartington/oceanic-next', opt = true, as = "nextocean"}
    use {'Mofiqul/vscode.nvim', opt = true, as = "vscode"}

    -- Ocationals Plugins
    use {"sindrets/diffview.nvim", opt = "true", as = "diffview"}
    use {'gelguy/wilder.nvim', opt = true, as = "wilder"}
end)
