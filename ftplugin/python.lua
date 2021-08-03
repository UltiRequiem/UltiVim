vim.cmd [[
  command! -buffer -bar PyRun :!python3.10 %
  command! -buffer -bar DelComments :g/#/d
]]

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':PyRun<CR>',
                            {noremap = true, expr = false, silent = true})

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rd', ':DelComments<CR>',
                            {noremap = true, expr = false, silent = true})

