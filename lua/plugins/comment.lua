return {
	"numToStr/Comment.nvim",
	config = function()
		-- Prevent the deprecated nvim-treesitter.configs integration from loading
		vim.g.skip_ts_context_commentstring_module = true
		local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
		require("Comment").setup({
			padding = true,
			sticky = true,
			ignore = "^$",
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
				extended = false,
			},
			pre_hook = prehook,
			post_hook = nil,
		})
	end,
	event = "BufReadPre",
	lazy = false,
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = { enable_autocmd = false },
		},
	},
}
