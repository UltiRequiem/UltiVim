-- https://github.com/nvim-treesitter/nvim-treesitter/issues/94
require('nvim-treesitter.configs').setup({
  incremental_selection = {
    enable = false,
  },
  highlight = {
    enable = true,
  },
})
