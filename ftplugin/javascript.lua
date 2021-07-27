vim.cmd [[
  command! -buffer -bar NodeRun :!node %
  nnoremap <buffer> <Leader>rp :NodeRun<CR>
]]
