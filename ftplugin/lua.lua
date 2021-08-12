vim.cmd [[
  command! -buffer -bar LuaRun :!lua %
]]

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':LuaRun<CR>',
                            {noremap = true, expr = false, silent = true})
