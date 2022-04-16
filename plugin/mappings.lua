local expressive_mapper = function(mode, key, result)
        vim.api.nvim_set_keymap(mode, key, result, { silent = true, expr = true })
end

local plug_mapper = function(mode, key, result)
        vim.api.nvim_set_keymap(mode, key, result, {})
end

-- Define Mapleader
vim.g.mapleader = ' '

-- Escape from insert mode
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Duplicate Line
vim.keymap.set('n', 'tt', ':t.<CR>')

-- Toggle Numbers
vim.keymap.set('n', '<leader>n', ':set nu! rnu!<CR>')

-- Turn off search highlighting
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Get out of the Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Copy to OS clipboard.
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>yy', '"+yy')

-- Paste from OS clipboard
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('n', '<Leader>P', '"+P')
vim.keymap.set('v', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>P', '"+P"`"`"')

vim.keymap.set('n', 'J', 'mzJ`z')

-- Plugins Mappings ↓

vim.keymap.set('n', '<C-F>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<C-P>', ':Telescope find_files<CR>')

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

vim.keymap.set('n', '<Leader>f', ':HopWord<CR>')
vim.keymap.set('n', '<Leader>o', ':HopPattern<CR>')

vim.keymap.set('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]])

vim.keymap.set('n', '<F12>', ':CocCommand terminal.Toggle<CR>')
vim.keymap.set('n', '<F3>', ':call CocAction("format")<CR>')

plug_mapper('n', '<leader>rn', '<Plug>(coc-rename)')

plug_mapper('n', 'gd', '<Plug>(coc-definition)')
plug_mapper('n', 'gr', '<Plug>(coc-references)')

plug_mapper('n', '<leader>ca', '<Plug>(coc-codeaction)')
plug_mapper('n', '<leader>ga', '<Plug>(coc-codeaction-cursor)')
plug_mapper('x', '<leader>ga', '<Plug>(coc-codeaction-selected)')
plug_mapper('n', '<leader>kf', '<Plug>(coc-fix-current)')

plug_mapper('n', '<Right>', '<Plug>(coc-diagnostic-prev)')
plug_mapper('n', '<Left>', '<Plug>(coc-diagnostic-next)')

expressive_mapper('i', '<C-space>', 'coc#refresh()')

vim.cmd([[
nnoremap <silent> <M-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <M-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``

vnoremap <silent> <M-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv
vnoremap <silent> <M-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv

nnoremap <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
]])
