local m = require("util").lazy_map
local c = require("util").create_cmd

local opts = {
  formatters_by_ft = {
    css = { "prettierd" },
    html = { "prettierd" },
    htmlangular = { "prettierd" },
    javascript = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    lua = { "stylua" },
    scss = { "prettierd" },
    typescript = { "prettierd" },
    vue = { "prettierd" },
    fish = { "fish_indent" },
    sh = { "shfmt", "shellharden" },
    bash = { "shfmt", "shellharden" },
    markdown = { "cbfmt", "prettierd", "markdownlint" },
    go = { "goimports", "gofumpt" }, 
    templ = {
      "gofumpt",
      "templ",
      "injected",
    },
  },
  format_on_save = function(bufnr)
    return { timeout_ms = 500, lsp_fallback = true }
  end,
  notify_on_error = false,
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
    shellharden = {
      prepend_args = { "--transform" },
    },
    cbfmt = {
      prepend_args = { "--config", os.getenv("HOME") .. "/.config/cbfmt/cbfmt.toml" },
    },
  },
}

local function init()
  local function get_level(args)
    return args.bang and "g" or "b"
  end

  c("ConformFormatToggle", function(args)
    local level = get_level(args)
    vim[level].disable_autoformat = not vim[level].disable_autoformat
  end, {
    bang = true,
  })
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = opts,
  cmd = { "ConformInfo" },
  keys = {
    m("<leader>ci", [[ConformInfo]]),
  },
  init = init,
}
