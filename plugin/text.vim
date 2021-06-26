nnoremap <silent> <M-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <M-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``

inoremap <silent> <M-Up>    <C-O>m`<C-O>:move -2<CR><C-O>``
inoremap <silent> <M-Down>  <C-O>m`<C-O>:move +1<CR><C-O>``

vnoremap <silent> <M-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv
vnoremap <silent> <M-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv

set pumheight=10"
