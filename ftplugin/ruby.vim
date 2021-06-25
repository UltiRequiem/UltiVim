command! -buffer -bar RubyRun :w !ruby %
nnoremap <Leader>rp :RubyRun<CR>

command! -buffer -bar RuboCop :silent exec "!rubocop -A"

packadd rails
packadd ruby
setl cms=#\ %s
