local header = {
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	"██╗░░░██╗██╗░░░░░████████╗██╗██╗░░░██╗██╗███╗░░░███╗",
	"██║░░░██║██║░░░░░╚══██╔══╝██║██║░░░██║██║████╗░████║",
	"██║░░░██║██║░░░░░░░░██║░░░██║╚██╗░██╔╝██║██╔████╔██║",
	"██║░░░██║██║░░░░░░░░██║░░░██║░╚████╔╝░██║██║╚██╔╝██║",
	"╚██████╔╝███████╗░░░██║░░░██║░░╚██╔╝░░██║██║░╚═╝░██║",
	"░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
	[[]],
	[[]],
	[[]],
	[[]],
}

local opts = {
	theme = "doom",
	hide = {
		statusline = true,
		tabline = true,
		winbar = true,
	},
	config = {
		header = header,
		center = {
			{
				icon = "",
				desc = "Lazy sync / TSUpdate / MasonToolsUpdate",
				key = "s",
				action = "UpdateAndSyncAll",
			},
			{
				icon = "",
				desc = "One step for vimkind",
				key = "l",
				action = "OneStepForVimKindLaunch",
			},
			{
				icon = "",
				desc = "Mason",
				key = "m",
				action = "Mason",
			},
			{
				icon = "",
				desc = "Find files",
				key = "f",
				action = "Telescope find_files",
			},
			{
				icon = "",
				desc = "DiffView main/master",
				key = "d",
				action = "DiffviewMain",
			},
			{
				icon = "",
				desc = "DiffView prompt",
				key = "D",
				action = "DiffviewPrompt",
			},
			{
				icon = "",
				desc = "Restore session",
				key = "r",
				action = "PersistenceLoad",
			},
			{
				icon = "",
				desc = "Select session",
				key = "R",
				action = "PersistenceSelect",
			},
			{
				icon = "",
				desc = "Empty buffer",
				key = "e",
				action = "enew",
			},
			{
				icon = "",
				desc = "Quit",
				key = "q",
				action = "q",
			},
		},
		footer = function()
			local phrase = { "One last requiem.", "", "Zero" }

			return phrase
		end,
	},
}

local padding = {
	left = 3,
	right = 3,
}
for _, i in ipairs(opts.config.center) do
	i.desc = string.rep(" ", padding.left) .. i.desc .. string.rep(" ", padding.right)
end

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = opts,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
