vim.filetype.add({
	extension = {
		env = "env",
		rasi = "sass",
		prisma = "prisma",
	},
	pattern = {
		[".*%.md%.gpg"] = "markdown",
	},
})
