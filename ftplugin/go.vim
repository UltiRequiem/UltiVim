command! -buffer -bar GoRun :w !go run %
nnoremap <Leader>rp :GoRun<CR>
setl noet sw=4 sts=4 ts=4 fo-=t com=s1:/*,mb:*,ex:*/,:// cms=//\ %s isk+=" 
