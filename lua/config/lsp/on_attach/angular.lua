local M = {}

function M.on_attach(client, _bufnr)
	client.server_capabilities.renameProvider = false
end

return M
