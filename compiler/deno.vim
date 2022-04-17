if exists("current_compiler")
        finish
endif

let current_compiler = "deno"

setlocal makeprg=NO_COLOR=true\ deno\ run\ %
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
