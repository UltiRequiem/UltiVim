vim.cmd([[
  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=0 Q :q
  command! -nargs=0 W :w
]])
