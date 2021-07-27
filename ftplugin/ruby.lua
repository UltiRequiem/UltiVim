vim.cmd [[
  command! -buffer -bar RubyRun :!ruby %
  command! -buffer -bar RuboCop :silent exec "!rubocop -A"
  nnoremap <Leader> <buffer>rp :RubyRun<CR>
  nnoremap <Leader> <buffer>rl :RubyRun<CR>
]]
