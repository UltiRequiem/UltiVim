require("config")

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Copy to OS clipboard.
vim.keymap.set("n", "<Leader>y", '"+y')
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>yy", '"+yy')

-- Paste from OS clipboard
vim.keymap.set("n", "<Leader>p", '"+p')
vim.keymap.set("n", "<Leader>P", '"+P')
vim.keymap.set("v", "<Leader>p", '"+p')
vim.keymap.set("v", "<Leader>P", '"+P"`"`"')

vim.keymap.set("n", "J", "mzJ`z")

vim.cmd([[
filetype plugin indent on

nnoremap <silent> <M-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <M-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``

vnoremap <silent> <M-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv
vnoremap <silent> <M-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv

nnoremap <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :w<CR> :endif<CR>:bnext<CR>
]])

vim.keymap.set("n", "<space>n", function()
	require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle NeoTree" })
