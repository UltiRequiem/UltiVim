vim.cmd([[
  command! -buffer -bar Run :!php %
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
