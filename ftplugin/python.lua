vim.cmd [[
  command! -buffer -bar PyRun :!python3.10 %
  nnoremap <buffer><Leader>rp :PyRun<CR>
]]
