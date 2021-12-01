vim.cmd([[
  command! -buffer -bar Run :!rustc % -o main && ./main && rm main
]])

vim.cmd([[
  command! -buffer -bar RunTest :!rustc --test % -o main && ./main && rm main
]])


vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':Run<CR>', { noremap = true, expr = false, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rt', ':RunTest<CR>', { noremap = true, expr = false, silent = true })
