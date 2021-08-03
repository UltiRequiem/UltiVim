vim.cmd [[
  setl ts=2 sts=2 sw=2 et
  command! -buffer -bar DelComments :g/#/d
]]

vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rd', ':DelComments<CR>',
                            {noremap = true, expr = false, silent = true})

