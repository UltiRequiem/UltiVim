command! -buffer -bar RubyRun :w !ruby %
nnoremap <Leader>rp :RubyRun<CR>
packadd rails
packadd ruby
setl cms=#\ %s
