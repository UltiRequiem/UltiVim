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
  use({ 'ziglang/zig.vim', opt = true, as = 'ziglang' })
  use({ 'cespare/vim-toml', opt = true, as = 'toml' })
  use({ 'styled-components/vim-styled-components', opt = true, as = 'styled' })
  use({ 'udalov/kotlin-vim', opt = true, as = 'kotvim' })

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

--[[
{
  "dependencies": {
    "coc-diagnostic": ">=0.21.2",
    "coc-eslint": ">=1.4.5",
    "coc-highlight": ">=1.2.8",
    "coc-json": ">=1.3.6",
    "coc-lua": ">=1.0.1",
    "coc-pairs": ">=1.3.0",
    "coc-prettier": ">=1.1.24",
    "coc-pyright": ">=1.1.161",
    "coc-styled-components": ">=0.5.0",
    "coc-tabnine": ">=1.3.4",
    "coc-terminal": ">=0.6.0",
    "coc-toml": ">=1.1.0",
    "coc-tsserver": ">=1.8.3",
    "coc-word": ">=1.2.2",
    "coc-yaml": ">=1.4.2",
    "coc-yank": ">=1.2.0"
  }
} ]]
