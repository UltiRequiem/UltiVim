local config = function()
	require("telescope").setup({
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})
	require("telescope").load_extension("fzf")

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
end

local dependencies = {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-lua/plenary.nvim",
	"folke/neoconf.nvim",
}

return {
	"nvim-telescope/telescope.nvim",
	config = config,
	dependencies = dependencies,
	lazy = false,
}
