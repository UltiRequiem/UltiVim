-- vim: ft=lua tw=80
stds.nvim = {
  globals = {
    vim = { fields = { 'g' } },
    'CONFIG_PATH',
    'CACHE_PATH',
    'DATA_PATH',
    'TERMINAL',
    'USER',
    'C',
    'Config',
    'WORKSPACE_PATH',
    'JAVA_LS_EXECUTABLE',
    'MUtils',
    'USER_CONFIG_PATH',
    os = { fields = { 'capture' } },
  },
  read_globals = { 'jit', 'os', 'vim' },
}

std = 'lua51+nvim'

self = false

cache = true
