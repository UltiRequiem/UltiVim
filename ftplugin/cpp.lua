vim.cmd([[
  command! -buffer -bar Run :!g++ % && ./a.out && rm ./a.out
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
