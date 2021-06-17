local sorters,actions,previewers = require ("telescope.sorters"),require('telescope.actions'),require("telescope.previewers")

-- Setup Telescope
require("telescope").setup {
    defaults = {
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        initial_mode = "insert",
        prompt_position = "top",
        prompt_prefix = " ❯",
        file_ignore_patterns = {".git/*", "node_modules", "env/*"},
        shorten_path = true,
        color_devicons = true,
        winblend = 20,
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<Esc>"] = actions.close
            }
        }
    },
    extensions = {
        -- Preview media files
        media_files = {
            filetypes = {"png", "jpg", "pdf", "jpeg"},
            find_cmd = "rg"
        },
        -- Fast, fast, really fast sorter
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

-- Load Telescope extensions
require("telescope").load_extension("media_files")
require("telescope").load_extension("fzy_native")

-- Quickly change something on your settings
local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "UltiVim Config",
        cwd = "$HOME/.config/nvim"
    })
end

return M
