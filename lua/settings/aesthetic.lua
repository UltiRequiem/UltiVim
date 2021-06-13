 -- Numbers
vim.wo.number = true
vim.o.number = true

-- Relative Numbers!
vim.wo.relativenumber = true
vim.o.relativenumber = true

-- When line is longer than the screen, it continues on the next line
vim.wo.wrap = false
vim.o.wrap = false

-- But don't break words, only 'by words'
vim.wo.linebreak = true

-- Will put the new window below the currentone. (:sp)
vim.o.splitbelow = true

-- Will put the new window right of the current one. (:vs)
vim.o.splitright = true

-- Enables 24-bit RGB color in TUI
vim.o.termguicolors = true

-- Dark Background
vim.o.background = "dark"

-- Use Emoji
vim.o.emoji = true

-- Highlight the screen line of the cursor with CursorLine
vim.wo.cursorline = true

vim.cmd("colorscheme OceanicNext")
