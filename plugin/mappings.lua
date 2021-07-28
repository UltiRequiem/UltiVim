-- Mapping helper
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result,
                            {noremap = true, silent = true, expr = false})
end

-- Expressive Mapping helper
local expressive_mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {silent = true, expr = true})
end

-- Default Mapping helper
local plug_mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {})
end

-- Define Mapleader
vim.g.mapleader = " "

-- Escape from insert mode
mapper("i", "<C-c>", "<Esc>")

-- When I have a new buffer and need to put the name this useful
mapper("n", "<C-s>", ":w ")

-- Nice
mapper("n", "ZE", ":qa!<CR>")

-- Duplitcate Line
mapper("n", "tt", ":t.<CR>")

--  Toggle Numbers
mapper("n", "<leader>n", ":set nu! rnu!<CR>")

-- Tabs Stuff
mapper("n", "<S-t>", ":enew<CR>")
mapper("n", "<C-t>b", ":tabnew<CR>")
mapper("n", "<S-x>", ":bd!<CR>")

-- use ESC to turn off search highlighting
mapper("n", "<Esc>", ":noh<CR>")

-- get out of terminal with jk
mapper("t", "<Esc>", "<C-\\><C-n>")

-- Resize with arrows
mapper("n", "<C-Up>", ":resize -2<CR>")
mapper("n", "<C-Down>", ":resize +2<CR>")
mapper("n", "<C-Left>", ":vertical resize -2<CR>")
mapper("n", "<C-Right>", ":vertical resize +2<CR>")

-- Copy to OS clipboard.
mapper('n', '<Leader>y', '"+y')
mapper('v', '<Leader>y', '"+y')
mapper('n', '<Leader>yy', '"+yy')

-- Paste from OS clipboard
mapper('n', '<Leader>p', '"+p')
mapper('n', '<Leader>P', '"+P')
mapper('v', '<Leader>p', '"+p')
mapper('v', '<Leader>P', '"+P"`"`"')

-- Plugins Mappings ↓

-- Telescope
mapper("n", "<C-F>", ":Telescope live_grep<CR>")
mapper("n", "<C-P>", ":Telescope find_files<CR>")

-- Tree
mapper("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Hop.nvim
mapper("n", "<Leader>f", ":HopWord<CR>")
mapper("n", "<Leader>l", ":HopLine<CR>")
mapper("n", "<Leader>o", ":HopPattern<CR>")

-- Coc.nvim
mapper("n", "<Leader>k", ":CocCommand terminal.Toggle<CR>")
plug_mapper("n", "<leader>rn", "<Plug>(coc-rename)")
plug_mapper("i", "<C-l>", "<Plug>(coc-snippets-expand)")
expressive_mapper("i", "<C-space>", "coc#refresh()")
mapper("n", "<F3>", ":Format<CR>")
plug_mapper("n", "gd", "<Plug>(coc-definition)")
plug_mapper("n", "gr", "<Plug>(coc-references)")
plug_mapper("n", "<leader>ca", "<Plug>(coc-codeaction)")
plug_mapper("n", "<leader>kf", "<Plug>(coc-fix-current)")
plug_mapper("i", "<C-l>", "<Plug>(coc-snippets-expand-jump)")
