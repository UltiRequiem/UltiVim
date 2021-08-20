vim.cmd([[
  command! -buffer -bar CRun :!gcc % && ./a.out
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':CRun<CR>', { noremap = true, expr = false, silent = true })

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
