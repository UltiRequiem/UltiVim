vim.cmd([[
  command! -buffer -bar Run :!gcc % && ./a.out && rm ./a.out
]])


vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

-- Indent with Spaces
vim.bo.expandtab = true
