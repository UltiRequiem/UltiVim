vim.cmd([[
  command! -buffer -bar Run :!mcs % -out:a.exe && mono a.exe && rm a.exe
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
