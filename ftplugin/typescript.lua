vim.cmd([[
  command! -buffer -bar NodeRun :!ts-node %
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':NodeRun<CR>', { noremap = true, expr = false, silent = true })

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

-- Indent with Spaces
vim.bo.expandtab = true
