vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.vim_tree_tab_open = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_group_empty = 0
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_icon_padding = ' '

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '✗',
    staged = '✓',
    unmerged = '',
    renamed = '➜',
    untracked = '★',
    deleted = '',
    ignored = '◌',
  },
  folder = {
    default = '',
    open = '',
    arrow_open = '',
    arrow_closed = '',
    empty = ' ',
    empty_open = ' ',
    symlink = '',
    symlink_open = '',
  },
  lsp = { hint = ' ', info = ' ', warning = ' ', error = ' ' },
}

require('nvim-tree').setup({
  disable_netrw = true,
  hijack_netrw = true,

  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },

  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },

  filters = {
    dotfiles = false,
    custom = { '.git' },
  },

  view = {
    width = 35,
    side = 'right',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {},
    },
  },
})

vim.cmd('highlight NvimTreeFolderIcon guibg=blue')
