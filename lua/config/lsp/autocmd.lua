local M = {}

local function inlay_hints_autocmd(bufnr)
	local inlay_hints_group = vim.api.nvim_create_augroup("LSP_inlayHints", { clear = false })
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		group = inlay_hints_group,
		buffer = bufnr,
		callback = function()
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end,
	})
end

-- typescript-language-server's tsserver wraps compiled/dist definitions in a
-- separate "source definition" lookup (same command VS Code's
-- `typescript.preferGoToSourceDefinition` uses); plain textDocument/definition
-- stops at the nearest .d.ts when packages ship without declarationMap.
local function ts_goto_source_definition()
	local bufnr = vim.api.nvim_get_current_buf()
	local client = vim.lsp.get_clients({ bufnr = bufnr, name = "ts_ls" })[1]
	if not client then
		return vim.lsp.buf.definition()
	end
	local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
	client:request("workspace/executeCommand", {
		command = "_typescript.goToSourceDefinition",
		arguments = { params.textDocument.uri, params.position },
	}, function(err, result)
		if err or not result or vim.tbl_isempty(result) then
			return vim.lsp.buf.definition()
		end
		if #result == 1 then
			vim.lsp.util.jump_to_location(result[1], client.offset_encoding, true)
		else
			vim.fn.setqflist({}, " ", {
				title = "Source Definitions",
				items = vim.lsp.util.locations_to_items(result, client.offset_encoding),
			})
			vim.cmd("botright copen")
		end
	end, bufnr)
end

function M.init()
	return { inlay_hints_autocmd = inlay_hints_autocmd }
end

function M.inlay_hints()
	return inlay_hints_autocmd
end

function M.lsp_attach()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(event)
			local bufopts = { noremap = true, silent = true, buffer = event.buf }
			vim.keymap.set("n", "[g", function()
				vim.cmd("DiagnosticsErrorJumpPrev")
			end, bufopts)
			vim.keymap.set("n", "]g", function()
				vim.cmd("DiagnosticsErrorJumpNext")
			end, bufopts)
			vim.keymap.set("n", "[G", function()
				vim.cmd("DiagnosticsJumpPrev")
			end, bufopts)
			vim.keymap.set("n", "]G", function()
				vim.cmd("DiagnosticsJumpNext")
			end, bufopts)
			vim.keymap.set("n", "<leader>dd", vim.diagnostic.setqflist, bufopts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			-- if not require("neoconf").get("lsp.keys.goto_definition.disable") then
			vim.keymap.set("n", "gd", ts_goto_source_definition, bufopts)
			-- end
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "L", function()
				vim.lsp.buf.hover({ border = "rounded" })
			end, bufopts)
			vim.keymap.set("n", "<leader>di", function()
				local bufnr = event.buf
				local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
				if enabled then
					vim.api.nvim_create_augroup("LSP_inlayHints", { clear = true })
				else
					require("config.lsp.autocmd").inlay_hints()(bufnr)
				end
				vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
				require("notify").notify(
					string.format("Inlay hints %s for buffer %d", not enabled and "enabled" or "disabled", bufnr),
					vim.log.levels.INFO,
					---@diagnostic disable-next-line: missing-fields
					{
						title = "LSP inlay hints",
					}
				)
			end, bufopts)
			vim.keymap.set("n", "<leader>dI", function()
				local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
				vim.lsp.inlay_hint.enable(not enabled)
				require("notify").notify(
					string.format("Inlay hints %s globally", not enabled and "enabled" or "disabled"),
					vim.log.levels.INFO,
					---@diagnostic disable-next-line: missing-fields
					{
						title = "LSP inlay hints",
					}
				)
			end, { noremap = bufopts.noremap, silent = bufopts.silent })
		end,
	})
end

return M
