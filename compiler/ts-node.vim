if exists("current_compiler")
        finish
endif

let current_compiler = "ts-node"

setlocal makeprg=ts-node\ %
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
