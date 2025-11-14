-- Luacheck configuration for Neovim
std = "luajit"

-- Global vim namespace
globals = {
  "vim",
  "describe", -- For tests
  "it",       -- For tests
  "before_each", -- For tests
  "after_each",  -- For tests
  "P",        -- Global print function
  "RELOAD",   -- Global reload function
  "R",        -- Global require reload function
}

-- Ignore some common patterns
ignore = {
  "211", -- Unused variable (common in snippet utility files)
  "212", -- Unused argument
  "213", -- Unused loop variable
  "512", -- Loop is executed at most once (intentional early returns)
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