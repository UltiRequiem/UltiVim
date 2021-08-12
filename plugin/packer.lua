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
    opt = true,
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
  })
  use('Pocco81/AutoSave.nvim')
  use({ 'tpope/vim-surround', opt = true })
  use({
    'b3nj5m1n/kommentary',
    config = require('kommentary.config').use_extended_mappings(),
  })
  use({
    'nacro90/numb.nvim',
    opt = true,
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
  use({ 'pangloss/vim-javascript', opt = true, as = 'pangloss' })
  use({ 'HerringtonDarkholme/yats.vim', opt = true, as = 'yats' })
  use({ 'tpope/vim-markdown', opt = true, as = 'markdown' })
  use({ 'MaxMEllon/vim-jsx-pretty', opt = true, as = 'jsxpretty' })
  use({ 'hail2u/vim-css3-syntax', opt = true, as = 'csssyntax' })
  use({ 'styled-components/vim-styled-components', opt = true, as = 'styled' })

  -- UI Plugins
  use('glepnir/dashboard-nvim')
  use('hoob3rt/lualine.nvim')
  use('akinsho/nvim-bufferline.lua')
  use({
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  })

  -- Themes
  use({ 'mhartington/oceanic-next', opt = true, as = 'nextocean' })
  use({ 'Mofiqul/vscode.nvim', opt = true, as = 'vscode' })

  -- Ocationals Plugins
  use({ 'sindrets/diffview.nvim', opt = true, as = 'diffview' })
  use({ 'gelguy/wilder.nvim', opt = true, as = 'wilder' })
end)
