require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained',
  incremental_selection = {
    enable = false,
  },
  highlight = {
    enable = true,
     disable = { "javascriptreact" },
    additional_vim_regex_highlighting = false,
  },
})
