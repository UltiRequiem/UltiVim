# Neovim 0.12 Migration

Upgrade from **0.11.5 → 0.12.1**. Summary of every breaking change encountered
and how it was fixed.

---

## nvim-treesitter: master → main

The `master` branch is archived and incompatible with Neovim 0.12+. Switched
both `nvim-treesitter` and `nvim-treesitter-textobjects` to `branch = "main"`.

### API changes in the `main` branch

| Old (master)                                               | New (main)                                                                             |
| ---------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `require("nvim-treesitter.configs").setup(opts)`           | **Removed.** Use `require("nvim-treesitter").setup()`                                  |
| `ensure_installed = { ... }` inside setup                  | `require("nvim-treesitter.install").install({ ... })` (async, skips already installed) |
| `require("nvim-treesitter.locals")`                        | **Removed.** Walk the tree manually with `node:parent()`                               |
| `require("nvim-treesitter.ts_utils").get_node_at_cursor()` | `vim.treesitter.get_node()` (built-in)                                                 |
| `highlight = { enable = true }`                            | Not needed — Neovim 0.12 handles highlighting natively                                 |
| `jsonc` parser                                             | Not supported in `main` branch — removed from parser list                              |

### nvim-treesitter-textobjects `main` API

No more `configs.setup({ textobjects = { ... } })`. All keymaps are now
explicit:

```lua
require("nvim-treesitter-textobjects").setup({
  select = { lookahead = true },
  move = { set_jumps = true },
})

local sel = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "af", function()
  sel.select_textobject("@function.outer", "textobjects")
end)

local move = require("nvim-treesitter-textobjects.move")
vim.keymap.set({ "n", "x", "o" }, "]f", function()
  move.goto_next_start("@function.inner", "textobjects")
end)
```

Config: `lua/plugins/treesitter.lua`

---

## Go snippet util: removed nvim-treesitter module deps

`lua/snippets/util/filetype/go.lua` required `nvim-treesitter.locals` and
`nvim-treesitter.ts_utils`, both removed in the `main` branch.

Replaced with:

```lua
-- before
local ts_utils = require("nvim-treesitter.ts_utils")
local cursor_node = ts_utils.get_node_at_cursor()
local scope_tree = ts_locals.get_scope_tree(cursor_node, 0)

-- after
local cursor_node = vim.treesitter.get_node()

local function find_enclosing_func(node)
  local cur = node
  while cur do
    if func_types[cur:type()] then return cur end
    cur = cur:parent()
  end
end
```

---

## nvim-surround v4: keymaps removed from setup

`keymaps` can no longer be passed to `setup()`. Since all keymaps matched the v4
defaults, the entire `keymaps` table was removed. `aliases` and `highlight`
still work via opts.

Config: `lua/plugins/surround.lua`

---

## ts-error-translator: translate_diagnostics removed

`require("ts-error-translator").translate_diagnostics()` no longer exists. The
plugin now handles everything automatically via `setup({ auto_attach = true })`
(default). The manual `publishDiagnostics` handler override was removed from
`lua/config/lsp/handlers/init.lua`.

---

## nvim-dap-view: windows.height → windows.size

`windows.height` was renamed to `windows.size`.

Config: `lua/plugins/dap.lua`

---

## template-literal-comments.nvim: double-setup crash

Neovim 0.11+ raises an error when `add_directive` is called twice with the same
name. The plugin was set up twice — once as a treesitter dependency at startup,
and again on `ft` trigger.

Fix:

- Removed `ft = { "javascript", "typescript" }` (redundant since
  `nvim-treesitter` is `lazy = false`)
- Wrapped setup in `pcall` to silently swallow re-registration errors

```lua
{
  "bennypowers/template-literal-comments.nvim",
  config = function()
    pcall(require("template-literal-comments").setup, {})
  end,
}
```

Config: `lua/plugins/treesitter.lua`

---

## nvim-ts-context-commentstring: deprecated module integration

Must prevent the deprecated nvim-treesitter.configs integration path from
running:

```lua
-- comment.lua config function
vim.g.skip_ts_context_commentstring_module = true

-- dependency
{
  "JoosepAlviste/nvim-ts-context-commentstring",
  opts = { enable_autocmd = false },
}
```

Config: `lua/plugins/comment.lua`

---

## lspconfig: "ty" removed

`ty` is not a valid lspconfig server name. Removed from
`lua/config/lsp/servers.lua`.

---

## mason-lspconfig: stylua auto-started as broken LSP

`mason-lspconfig` v2+ has `automatic_enable = true` by default. It calls
`vim.lsp.enable()` for every installed Mason package, including formatter-only
tools. `nvim-lspconfig` ships `lsp/stylua.lua` which runs `stylua --lsp` — but
stylua has no LSP mode, causing exit code 2 on every Lua buffer.

Fix: exclude formatter-only tools from auto-enable:

```lua
-- lua/plugins/mason-lspconfig.lua
automatic_enable = {
  exclude = { "stylua" },
},
```

> If other formatter-only Mason packages start causing the same error, check
> whether they have a file in `~/.local/share/nvim/lazy/nvim-lspconfig/lsp/` and
> add them to the exclude list.

Config: `lua/plugins/mason-lspconfig.lua`

---

## tree-sitter CLI: now a separate brew package

The `tree-sitter` Homebrew formula was split. Installing `tree-sitter` now only
provides the C library (`libtree-sitter`), not the CLI binary. The
nvim-treesitter `main` branch requires the CLI to compile parsers.

```sh
brew install tree-sitter-cli
```
