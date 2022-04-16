vim.cmd([[
  command! -buffer -bar Run :!rustc % -o main && ./main && rm main
]])

vim.cmd([[
  command! -buffer -bar RunTest :!rustc --test % -o main && ./main && rm main
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
vim.keymap.set("n","<leader>rt","<cmd>:RunTest<cr>",{silent=true, buffer=true})
