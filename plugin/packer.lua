require('packer').startup(function(use)
        use('wbthomason/packer.nvim')

        use({
                'neoclide/coc.nvim',
                branch = 'master',
                run = 'yarn install --frozen-lockfile',
        })

        use({
                'phaazon/hop.nvim',
                branch = 'v1',
                config = function()
                        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
                end
        })

        use('tpope/vim-surround')

        use({
                'b3nj5m1n/kommentary',
                config = function()
                        require('kommentary.config').use_extended_mappings()
                end,
        });

        use({
                'nvim-telescope/telescope.nvim',
                requires = {
                        'nvim-lua/popup.nvim',
                        'nvim-lua/plenary.nvim',
                        'nvim-telescope/telescope-file-browser.nvim',
                        'nvim-telescope/telescope-fzy-native.nvim',
                },
        })

        -- Syntax Highlighting
        use({
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate', requires= {"p00f/nvim-ts-rainbow"}
        })

        -- UI Plugins
        use('glepnir/dashboard-nvim')
        use('nvim-lualine/lualine.nvim')
        use('akinsho/nvim-bufferline.lua')

        use({
                'kyazdani42/nvim-tree.lua',
                requires = { 'kyazdani42/nvim-web-devicons' },
        })

        -- Themes
        use({ 'marko-cerovac/material.nvim', as = 'material' });
end)
