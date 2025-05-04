return {
	"zbirenbaum/copilot.lua",
	lazy = false,
	config = function()
		require("copilot").setup({
			filetypes = {
				["*"] = true,
			},
		})
	end,
}
