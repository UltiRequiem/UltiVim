-- Mapping helper
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

-- Define Mapleader
vim.g.mapleader = " "

-- Nice
mapper("n", "<Leader>w", ":w<CR>")
mapper("n", "<Leader>q", ":q<CR>")
mapper("n", "<Leader>d", ":qa!<CR>")

-- Duplitcate Line
mapper("n", "tt", ":t.<CR>")

-- Change Buffer
mapper("n","<C-m>",":bnext<CR>")
mapper("n","<C-n>",":bprev<CR>")

mapper("n","<Leader>b",":ls<CR>:b<Space>")

-- Resize with arrows
mapper("n", "<C-Up>", ":resize -2<CR>")
mapper("n", "<C-Down>", ":resize +2<CR>")
mapper("n", "<C-Left>", ":vertical resize -2<CR>")
mapper("n", "<C-Right>", ":vertical resize +2<CR>")

-- Better window movement
mapper("n", "<C-h>", "<C-w>h")
mapper("n", "<C-j>", "<C-w>j")
mapper("n", "<C-k>", "<C-w>k")
mapper("n", "<C-l>", "<C-w>l")

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
mapper("n", ",v", ":lua require('plugins.telescope').search_dotfiles()<CR>")
mapper("n", ",p", ":Telescope media_files<CR>")

-- Hop.nvim
mapper("n", "<Leader>f", ":HopWord<CR>")
mapper("n", "<Leader>l", ":HopLine<CR>")
mapper("n", "<Leader>o", ":HopPattern<CR>")

-- File Tree Explorer
mapper("n", "<Leader>e", ":NvimTreeToggle<CR>")
