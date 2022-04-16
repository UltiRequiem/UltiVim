vim.cmd([[
  command! -buffer -bar NodeRun :!node %
]])

vim.cmd([[
  command! -buffer -bar Run :!NO_COLOR=true deno run --no-check -A %
]])

vim.keymap.set("n","<leader>rp","<cmd>:Run<cr>",{silent=true, buffer=true})
