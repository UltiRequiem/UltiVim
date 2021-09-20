return require('packer').startup(function(use)
  -- Packer Itself
  use('wbthomason/packer.nvim')

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

  use({ 'Pocco81/AutoSave.nvim', opt = true })

  use({'wakatime/vim-wakatime',opt=false})

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

  -- Syntax Highlighting
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- UI Plugins
  use('glepnir/dashboard-nvim')
  use('hoob3rt/lualine.nvim')
  use('p00f/nvim-ts-rainbow')
  use('akinsho/nvim-bufferline.lua')
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  })

  -- Themes
  use({ 'marko-cerovac/material.nvim', opt = false, as = 'material' })

  -- Ocasional Plugins
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
