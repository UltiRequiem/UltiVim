vim.cmd([[
  command! -buffer -bar Run :!python %
  command! -buffer -bar PoetryRun :!poetry run python %
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':Run<CR>', { noremap = true, expr = false, silent = true })

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4

-- Indent with Spaces
vim.bo.expandtab = true
