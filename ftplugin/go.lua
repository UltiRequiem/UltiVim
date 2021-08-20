vim.cmd([[
  command! -buffer -bar GoRun :!go run %
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':GoRun<CR>', { noremap = true, expr = false, silent = true })
