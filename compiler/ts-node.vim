if exists("current_compiler")
        finish
endif

let current_compiler = "ts-node"

if exists(":CompilerSet") != 2
        command! -nargs=* CompilerSet setlocal <args>
endif


CompilerSet makeprg=ts-node\ %
CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
