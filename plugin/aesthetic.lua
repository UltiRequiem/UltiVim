-- Print the line number in front of each line
vim.wo.number = true
vim.o.number = true

-- Show the line number relative to the line with the cursor in front of each line
vim.wo.relativenumber = true
vim.o.relativenumber = true

-- Lines longer than the width of the window will wrap and displaying continues on the next line
vim.wo.wrap = false
vim.o.wrap = false

-- But don't break words, only 'by words'
vim.wo.linebreak = true

-- Will put the new window below the currentone
vim.o.splitbelow = true

-- Will put the new window right of the current one
vim.o.splitright = true

-- Enables 24-bit RGB color in TUI
vim.o.termguicolors = true

-- Dark Background
vim.o.background = "dark"

-- Use Emoji
vim.o.emoji = true

-- Highlight the screen line of the cursor with CursorLine
vim.wo.cursorline = true

vim.o.pumheight = 10

-- Oceanic Next
vim.cmd [[
  packadd nextocean
  colorscheme OceanicNext
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
]]

-- VSCode Theme
-- vim.g.vscode_style = "dark"
-- 
-- vim.cmd [[
--   packadd vscode
--   colorscheme vscode
-- ]]

vim.cmd [[
  let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache','yarn.lock','package-lock.json' ]
]]
