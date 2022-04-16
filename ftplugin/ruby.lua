vim.cmd([[
  command! -buffer -bar Run :!ruby %
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
