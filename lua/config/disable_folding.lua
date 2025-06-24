-- This file explicitly disables automatic code folding
local opt = vim.opt

-- Disable folding completely
opt.foldenable = false

-- Set high fold levels for cases where folding might still be activated
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Don't use any automatic folding methods
opt.foldmethod = "manual"

-- Function to disable folding completely
local disable_folding = function()
  vim.wo.foldenable = false
  vim.wo.foldmethod = "manual"
end

-- Apply these settings when buffers are loaded
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = disable_folding
})

-- Apply these settings when a file is read
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = disable_folding
})

-- Force all folds to be open when switching buffers or opening files
vim.api.nvim_create_autocmd({"BufReadPost", "BufEnter"}, {
  pattern = "*",
  command = "normal zR"
})
