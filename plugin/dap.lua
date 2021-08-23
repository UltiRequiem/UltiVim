function Dap()
  -- Load Plugins

  vim.cmd([[packadd dap]])
  vim.cmd([[packadd teledap]])
  vim.cmd([[packadd dapy]])
  vim.cmd([[packadd dapui]])

  local dap = require('dap')

  dap.adapters.ruby = {
    type = 'executable',
    command = 'bundle',
    args = { 'exec', 'readapt', 'stdio' },
  }

  dap.configurations.ruby = {
    {
      type = 'ruby',
      request = 'launch',
      name = 'Rails',
      program = 'bundle',
      programArgs = { 'exec', 'rails', 's' },
      useBundler = true,
    },
  }

  dap.adapters.netcoredbg = {
    type = 'executable',
    command = '/usr/bin/netcoredbg',
    args = { '--interpreter=vscode' },
  }

  dap.configurations.cs = {
    {
      type = 'netcoredbg',
      name = 'launch - netcoredbg',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
    },
  }

  require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

  print(' Ready to Debug!')
end
