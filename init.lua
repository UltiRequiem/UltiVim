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

-- Define Mapleader
vim.g.mapleader = ' '

-- Duplicate Line
vim.keymap.set('n', 'tt', ':t.<CR>')

-- Turn off search highlighting
vim.keymap.set('n', '<Esc>', ':noh<CR>')

-- Get out of the Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Tree
vim.keymap.set('n', '<C-n>', ':NvimTreeOpen<CR>')

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

vim.cmd([[
filetype plugin indent on

nnoremap <silent> <M-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <M-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``

vnoremap <silent> <M-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv
vnoremap <silent> <M-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv

nnoremap <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :w<CR> :endif<CR>:bnext<CR>
]])

require("config.lazy")


require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  auto_install = true,

  highlight = {
    enable = true,
  },
}

 -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }