local leet_arg = "leetcode.nvim"

local opts = {
	lang = "cpp",
	storage = {
		home = vim.fn.expand("$HOME") .. "/Documents/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},
	arg = leet_arg,
	keys = {
		toggle = { "q" },
		confirm = { "<CR>" },
		reset_testcases = "r",
		use_testcase = "U",
		focus_testcases = "H",
		focus_result = "L",
	},
}

return {
	"kawre/leetcode.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("leetcode").setup(opts)
		vim.cmd([[silent! Copilot disable]])
		vim.g.leetcode = true
	end,
	lazy = leet_arg ~= vim.fn.argv()[1],
}
