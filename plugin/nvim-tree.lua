vim.g.nvim_tree_side = "right"
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.vim_tree_tab_open = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 1
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_group_empty = 0
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_hijack_cursor = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_update_cwd = 0

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        arrow_open = "",
        arrow_closed = "",
        empty = " ",
        empty_open = " ",
        symlink = "",
        symlink_open = ""
    },
    lsp = {hint = " ", info = " ", warning = " ", error = " "}
}

vim.cmd("highlight NvimTreeFolderIcon guibg=blue")
