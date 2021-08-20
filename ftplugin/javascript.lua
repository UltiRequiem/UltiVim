vim.cmd([[
  command! -buffer -bar NodeRun :!node %
  command! -buffer -bar DocThis :CocCommand docthis.documentThis
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':NodeRun<CR>', { noremap = true, expr = false, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rd', ':DocThis<CR>', { noremap = true, expr = false, silent = true })
