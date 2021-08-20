vim.cmd([[
  command! -buffer -bar RubyRun :!ruby %
  command! -buffer -bar RuboCop :silent exec "!rubocop -A %"
]])

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':RubyRun<CR>', { noremap = true, expr = false, silent = true })

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rl', ':RuboCop<CR>', { noremap = true, expr = false, silent = true })

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

-- Indent with Spaces
vim.bo.expandtab = true
