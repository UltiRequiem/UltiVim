function delete_word(word)
    vim.api.nvim_command([[%s/]] .. word .. [[//g]])
end

function replace_word(original, replace)
    vim.api.nvim_command([[%s/]] .. original .. [[/]] .. replace .. [[/g]])
end
