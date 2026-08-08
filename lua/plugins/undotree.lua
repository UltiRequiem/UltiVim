local m = require("util").lazy_map

local opts = {
	float_diff = false,
	layout = "left_bottom", -- "left_bottom", "left_left_bottom"
	ignore_filetype = {
		"Undotree",
		"UndotreeDiff",
		"qf",
		"TelescopePrompt",
		"spectre_panel",
		"tsplayground",
	},
	window = {
		winblend = 2,
	},
	keymaps = {
		["move_next"] = "j",
		["move_prev"] = "k",
		["move_change_next"] = "J",
		["move_change_prev"] = "K",
		["action_enter"] = "<cr>",
		["enter_diffbuf"] = "p",
		["quit"] = "q",
	},
}
return {
	"jiaoshijie/undotree",
	opts = opts,
	event = "BufReadPre",
	keys = {
		m("<leader>u", [[lua require("undotree").toggle()]], { "n", "x" }),
	},
	dependencies = "nvim-lua/plenary.nvim",
}
