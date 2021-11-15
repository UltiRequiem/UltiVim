require('packer').startup(function(use)
  -- Packer Itself
  use('wbthomason/packer.nvim')

  use({ 'github/copilot.vim' })

  -- LSP Provider
  use({
    'neoclide/coc.nvim',
    branch = 'master',
    run = 'yarn install --frozen-lockfile',
  })

  -- Utilities
  use({
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
  })

  use({
    'andweeb/presence.nvim',
    config = function()
      require('presence'):setup({
        auto_update = true,
        neovim_image_text = 'The One True Text Editor',
        main_image = 'neovim',
        client_id = '793271441293967371',
        log_level = nil,
        debounce_timeout = 10,
        enable_line_number = false,
        blacklist = {},
        buttons = true,

        editing_text = 'Editing %s',
        file_explorer_text = 'Browsing %s',
      })
    end,
  })

  use({ 'Pocco81/AutoSave.nvim', opt = true })

  use({ 'wakatime/vim-wakatime', opt = false })

  use({
    'AckslD/nvim-neoclip.lua',
    config = function()
      require('neoclip').setup()
      require('telescope').load_extension('neoclip')
    end,
  })

  use('lewis6991/gitsigns.nvim')

  use({ 'tpope/vim-surround' })

  use({
    'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').use_extended_mappings()
    end,
  })

  use({
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end,
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
  })

  use({'RishabhRD/nvim-cheat.sh',requires={'RishabhRD/popfix'}})

  -- Syntax Highlighting
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- UI Plugins
  use('glepnir/dashboard-nvim')
  use('nvim-lualine/lualine.nvim')
  use('p00f/nvim-ts-rainbow')
  use('akinsho/nvim-bufferline.lua')
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  })

  -- Themes
  use({ 'marko-cerovac/material.nvim', opt = false, as = 'material' })

  -- Ocasional Plugins

  use({
    'tanvirtin/vgit.nvim',
    opt = true,
    config = function()
      require('vgit').setup()
    end,
  })

  use({ 'kdheepak/lazygit.nvim', opt = true })

  use({
    'lukas-reineke/indent-blankline.nvim',
    opt = true,
    config = function()
      require('indent_blankline').setup({
        char = '|',
        buftype_exclude = { 'terminal', 'dashboard' },
      })
    end,
  })

  use({ 'ellisonleao/glow.nvim', run = 'GlowInstall', opt = true })

  use({ 'Pocco81/TrueZen.nvim', opt = true })

  use({
    'pwntester/octo.nvim',
    opt = true,
    config = function()
      require('octo').setup()
    end,
  })
end)
