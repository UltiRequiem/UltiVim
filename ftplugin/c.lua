vim.cmd([[
  command! -buffer -bar Run :!gcc % && ./a.out && rm ./a.out
]])


vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
