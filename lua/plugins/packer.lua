return require("packer").startup(
    function()
        -- Let Packer manage it self
        use {"wbthomason/packer.nvim"}

        -- Intellisense and Autocompletion
        use {"neoclide/coc.nvim"}

        -- Aesthetic
        use {"mhartington/oceanic-next"} -- Theme
        use {"hoob3rt/lualine.nvim"} -- Statusline
        use {"kyazdani42/nvim-web-devicons"} -- Icons

        -- File Tree
        use {"kyazdani42/nvim-tree.lua"}

        -- Git Integration
        use {"lewis6991/gitsigns.nvim"}

        -- My Dashboard
        use {"glepnir/dashboard-nvim"}

        -- Better Easy motion
        use {"phaazon/hop.nvim"}

        -- <C-p> from Future
        use {
            "nvim-telescope/telescope.nvim",
            -- Extensions ⬇️
            requires = {
                {"nvim-telescope/telescope-fzy-native.nvim"},
                {"nvim-telescope/telescope-media-files.nvim"}
            }
        }

        -- Common Libraries
        use {"nvim-lua/plenary.nvim"}
        use {"nvim-lua/popup.nvim"}

        -- JavaScript
        use {"othree/yajs.vim", ft = {"javascript"}}
        use {"othree/es.next.syntax.vim", ft = {"javascript"}}

        -- TypeScript
        use {"HerringtonDarkholme/yats.vim", ft = {"typeScript"}}

        -- HTML
        use {"othree/html5.vim", ft = {"html"}}

        -- Python
        -- I have to search something like pangloss/vim-javascript for Python
    end
)
