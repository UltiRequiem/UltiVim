return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.lsp.enable("pyright")
	end,
	dependencies = {
		"windwp/nvim-autopairs",
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = "williamboman/mason.nvim",
		},
		"b0o/schemastore.nvim",
		"kevinhwang91/nvim-ufo",
		"VidocqH/lsp-lens.nvim",
		"jubnzv/virtual-types.nvim",
		"folke/neoconf.nvim",
		{
			"dmmulroy/ts-error-translator.nvim",
			config = true,
			ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
		},
		{
			"chrisgrieser/nvim-lsp-endhints",
			event = "LspAttach",
			opts = {
				icons = {
					type = "󰋙 ",
					parameter = " ",
				},
				label = {
					padding = 1,
					marginLeft = 0,
					bracketedParameters = false,
				},
				autoEnableHints = false,
			},
		},
	},
}
