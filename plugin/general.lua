-- Fold Stuff
vim.wo.foldenable = false
vim.wo.foldnestmax = 10
vim.wo.foldmethod = 'syntax'

-- Work with several buffers
vim.o.hidden = true

-- Nice Time
vim.o.updatetime = 250

-- Tabs to Spaces
vim.o.expandtab = true
vim.bo.expandtab = true

-- Correct level of indentation
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- I have a special configuration for each file in ftplugin/
vim.o.softtabstop = 4
vim.bo.softtabstop = 4

-- Autoident
vim.o.autoindent = true
vim.bo.autoindent = true

-- Highlight all matches while searching
vim.o.incsearch = true
vim.o.hlsearch = true

-- Ignorecase ins search pattern
vim.o.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains upper case characters
vim.o.smartcase = true

-- Swapfiles are nice
vim.o.swapfile = true

-- Swapfile config
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.directory = vim.fn.expand(vim.fn.stdpath('data') .. '/swap//')

-- Backups are nice
vim.o.backup = true

-- Backup config
vim.o.backupcopy = 'yes'
vim.o.backupdir = vim.fn.expand(vim.fn.stdpath('data') .. '/backup//')

-- Undofiles are truly nice!
vim.o.undofile = true
vim.o.undodir = vim.fn.expand(vim.fn.stdpath('data') .. '/undo//')

-- Shows the effects of a command incrementally, as you type
vim.o.inccommand = 'split'

-- WildIgnore Stuff
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

-- Finally, set wildignore...
vim.o.wildignore = wildignore

-- Suffixes Stuff
-- Get a lower priority when multiple files match a wildcard
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

-- Finally, set suffixesed...
vim.o.suffixes = suffixes

--  When set case is ignored when completing file names and directories
vim.o.wildignorecase = true
vim.o.wildcharm = 26

-- Enables "enhanced mode" of command-line completion... that its <Tab> completion
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 3
vim.o.sidescrolloff = 3

-- RipGrep needed
vim.o.grepprg = 'rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs'
vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- Important
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Very lazy please
vim.o.lazyredraw = true

-- Error Format
vim.o.errorformat = vim.o.errorformat .. ',%f'

-- Necesary
vim.cmd('filetype plugin indent on')

-- Visually select and copy without line numbers
vim.o.mouse = 'a'

-- Don't redraw while executing macros
vim.o.ttyfast = true

-- Dark Background
vim.o.background = 'dark'

-- File Format
vim.o.ff = 'unix'

-- Bigger history
vim.g.history = 1000

-- Add chars to '%'
vim.bo.matchpairs = "(:),{:},[:],<:>,':'"
