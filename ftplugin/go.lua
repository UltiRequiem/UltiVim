vim.cmd [[
  command! -buffer -bar GoRun :!go run %
  setl noet sw=4 sts=4 ts=4 fo-=t com=s1:/*,mb:*,ex:*/,:// cms=//\ %s isk+=" 
]]

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':GoRun<CR>',
                            {noremap = true, expr = false, silent = true})
