require('nvim-treesitter.configs').setup({
  incremental_selection = { enable = false },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },

  rainbow = {
    enable = true,
    extended_mode = true,
  },
})
