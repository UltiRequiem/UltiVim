vim.cmd([[
  command! -buffer -bar Run :!mcs % -out:a.exe && mono a.exe; rm a.exe
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':Run<CR>', { noremap = true, expr = false, silent = true })
