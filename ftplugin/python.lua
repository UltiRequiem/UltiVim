vim.cmd([[
  command! -buffer -bar Run :!python %
  command! -buffer -bar PoetryRun :!poetry run python %
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
