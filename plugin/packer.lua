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
    opt = false,
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
  })

  use('Pocco81/AutoSave.nvim')

  use({ 'tpope/vim-surround', opt = false })
  use({
    'b3nj5m1n/kommentary',
    config = require('kommentary.config').use_extended_mappings(),
  })
  use({
    'nacro90/numb.nvim',
    opt = false,
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
  use('akinsho/nvim-bufferline.lua')
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  })

  -- Themes
  use({ 'mhartington/oceanic-next', opt = false, as = 'nextocean' })
end)
