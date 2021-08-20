vim.cmd([[
  command! -buffer -bar Run :!go run %
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':Run<CR>', { noremap = true, expr = false, silent = true })

-- Indent with Spaces
vim.bo.expandtab = true
