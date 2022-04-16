vim.cmd([[
  command! -buffer -bar Run :!go run %
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
