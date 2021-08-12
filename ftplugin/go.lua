vim.cmd [[
  command! -buffer -bar GoRun :!go run %
  setl fo-=t com=s1:/*,mb:*,ex:*/,:// cms=//\ %s isk+=" 
]]

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':GoRun<CR>',
                            {noremap = true, expr = false, silent = true})


vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.noexpandtab = true
vim.bo.tabstop = true
