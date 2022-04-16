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

vim.o.ttyfast = true

vim.o.background = 'dark'

vim.o.ff = 'unix'

vim.g.history = 1000

vim.bo.matchpairs = "(:),{:},[:],<:>,':'"
