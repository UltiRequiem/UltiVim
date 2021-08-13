vim.cmd([[
  command! -buffer -bar PyRun :!python3.10 %
  command! -buffer -bar PoetryRun :!poetry run python %
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':PyRun<CR>', { noremap = true, expr = false, silent = true })
