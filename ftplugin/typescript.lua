vim.cmd [[
  packadd yats
  command! -buffer -bar NodeRun :!ts-node %
  setl formatprg=prettier\ --parser\ typescript
]]

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rp', ':NodeRun<CR>',
                            {noremap = true, expr = false, silent = true})
