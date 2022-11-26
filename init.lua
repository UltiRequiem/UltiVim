local data = vim.fn.stdpath('data')

vim.wo.foldenable = false
vim.o.hidden = true
vim.o.updatetime = 250
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.swapfile = true

vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.directory = vim.fn.expand(data .. '/swap//')

vim.o.backup = true
vim.o.backupcopy = 'yes'
vim.o.backupdir = vim.fn.expand(data .. '/backup//')

vim.o.undofile = true
vim.o.undodir = vim.fn.expand(data .. '/undo//')

vim.o.inccommand = 'split'

local wildignored = {
        'tags',
        '*/__pycache__/*',
        'build/*',
        'build.?/*',
        '*/node_modules/*',
        '*/env/*',
        '*.png',
        '*.jpg',
        '*.jpeg',
        '*/migrations/*',
        '*/.git/*',
}

local wildignore = ''

for i = 1, #wildignored do
        wildignore = wildignore .. wildignored[i] .. ','
end

vim.o.wildignore = wildignore

local suffixesed = {
        '.aux',
        '.log',
        '.dvi',
        '.bbl',
        '.blg',
        '.brf',
        '.cb',
        '.ind',
        '.idx',
        '.ilg',
        '.inx',
        '.out',
        '.toc',
        '.o',
        '.obj',
        '.dll',
        '.class',
        '.pyc',
        '.ipynb',
        '.so',
        '.swp',
        '.zip',
        '.exe',
        '.jar',
        '.gz',
}

local suffixes = ''
for i = 1, #suffixesed do
        suffixes = suffixes .. suffixesed[i] .. ','
end

vim.o.suffixes = suffixes

vim.o.wildignorecase = true
vim.o.wildcharm = 26

vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

vim.o.scrolloff = 3
vim.o.sidescrolloff = 3

vim.o.grepprg = 'rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs'
vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

vim.o.completeopt = 'menuone,noinsert,noselect'

vim.o.lazyredraw = true

vim.o.errorformat = vim.o.errorformat .. ',%f'

vim.o.mouse = 'a'

vim.o.background = 'dark'

vim.o.ff = 'unix'

vim.g.history = 1000

vim.bo.matchpairs = "(:),{:},[:],<:>,':'"

-- Print the line number in front of each line
vim.wo.number = true
vim.o.number = true

-- Show the line number relative to the line with the cursor in front of each line
vim.wo.relativenumber = true
vim.o.relativenumber = true

-- Lines longer than the width of the window will wrap and displaying continues on the next line
vim.wo.wrap = false
vim.o.wrap = false

-- vim.o.textwidth = 30

-- But don't break words, only 'by words'
vim.wo.linebreak = true

-- Will put the new window below the currentone
vim.o.splitbelow = true

-- Will put the new window right of the current one
vim.o.splitright = true

-- Enables 24-bit RGB color in TUI
vim.o.termguicolors = true

vim.o.emoji = true

-- Highlight the screen line of the cursor with CursorLine
vim.wo.cursorline = true

vim.o.pumheight = 10

-- Theme
vim.g.material_style = 'palenight'
vim.cmd('colorscheme material')


local expressive_mapper = function(mode, key, result)
        vim.api.nvim_set_keymap(mode, key, result, { silent = true, expr = true })
end

local plug_mapper = function(mode, key, result)
        vim.api.nvim_set_keymap(mode, key, result, {})
end

-- Define Mapleader
vim.g.mapleader = ' '

-- Duplicate Line
vim.keymap.set('n', 'tt', ':t.<CR>')

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

vim.keymap.set('n', '<Leader>o', ':HopWord<CR>')

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

vim.keymap.set("n","<leader>rp",":make<CR>")

vim.cmd([[
filetype plugin indent on

nnoremap <silent> <M-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <M-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``

vnoremap <silent> <M-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv
vnoremap <silent> <M-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv

nnoremap <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
]])
