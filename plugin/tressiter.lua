require('nvim-treesitter.configs').setup({
  incremental_selection = { enable = false },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },

  rainbow = {
    -- enable = true,
    extended_mode = true,
  },
})

-- require "nvim-treesitter.parsers".get_parser_configs().Solidity = {
--     install_info = {
--       url = "https://github.com/JoranHonig/tree-sitter-solidity",
--       files = {"src/parser.c"},
--       requires_generate_from_grammar = true,
--     },
--     filetype = 'solidity'
--   }
