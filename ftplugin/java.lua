vim.cmd([[
  command! -buffer -bar JavaRun :!java %
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':JavaRun<CR>', { noremap = true, expr = false, silent = true })
