local M = {}

local host = "127.0.0.1"

function M.setup(dap)
	dap = dap or require("dap")

	-- Go
	if not dap.adapters.go then
		require("config.dap.go").setup(dap, host)
	end

	for _, lang in ipairs({
		"typescript",
		"javascript",
	}) do
		dap.configurations[lang] = dap.configurations[lang] or {}
		dap.configurations[lang] = {
			{
				type = "pwa-chrome",
				request = "launch",
				name = 'Start Chrome with "localhost"',
				url = "http://localhost:4200",
				webRoot = "${workspaceFolder}",
				userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
				sourceMaps = true,
			},
		}
	end

	-- lua
	dap.configurations.lua = {
		{
			type = "nlua",
			request = "attach",
			name = "Neovim lua",
		},
	}
	dap.adapters.nlua = function(callback, config)
		callback({ type = "server", host = config.host or host, port = config.port or 8086 })
	end
end

return M
