local opts = {
	-- Exclude formatter-only tools that Mason installs but shouldn't be started as LSP servers.
	-- mason-lspconfig auto-enables all installed Mason packages via vim.lsp.enable(); formatters
	-- like stylua have an lsp/ config in nvim-lspconfig that tries to run them with --lsp, which fails.
	automatic_enable = {
		exclude = { "stylua" },
	},
	ensure_installed = {
		"angularls",
		"awk_ls",
		"bashls",
		"clangd",
		"csharp_ls",
		"cssls",
		"cssmodules_ls",
		"diagnosticls",
		"docker_compose_language_service",
		"dockerls",
		"emmet_ls",
		"eslint",
		"golangci_lint_ls",
		"gopls",
		"html",
		"jsonls",
		"lua_ls",
		"marksman",
		"prismals",
		"powershell_es",
		"sqlls",
		"tailwindcss",
		"yamlls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
