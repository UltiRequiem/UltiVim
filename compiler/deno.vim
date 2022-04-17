if exists("current_compiler")
        finish
endif

let current_compiler = "deno"

if exists(":CompilerSet") != 2
        command! -nargs=* CompilerSet setlocal <args>
endif


CompilerSet makeprg=NO_COLOR=true\ deno\ run\ %
CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
