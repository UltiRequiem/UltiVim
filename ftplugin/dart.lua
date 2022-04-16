vim.cmd([[
  command! -buffer -bar Run :!dart run %
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
