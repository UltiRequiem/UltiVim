-- Luacheck configuration for Neovim
std = "luajit"

-- Global vim namespace
globals = {
  "vim",
  "describe", -- For tests
  "it",       -- For tests
  "before_each", -- For tests
  "after_each",  -- For tests
}

-- Ignore some common patterns
ignore = {
  "212", -- Unused argument
  "213", -- Unused loop variable
  "631", -- Line is too long (we'll use stylua for formatting)
}

-- Exclude files/directories
exclude_files = {
  "lua/snippets/**", -- Generated snippets
  ".luarocks/",
  ".lazy/",
}

-- Per-file type overrides
files["lua/plugins/*.lua"] = {
  globals = { "vim" }
}

files["lua/config/**/*.lua"] = {
  globals = { "vim" }
}

-- Allow unused variables starting with underscore
unused_args = false
unused = false