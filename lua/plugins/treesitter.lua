local config = function()
	-- nvim-treesitter main branch: parser management only.
	-- Neovim 0.12+ handles highlighting natively.
	require("nvim-treesitter").setup()

	-- Install missing parsers in the background (skips already-installed ones).
	require("nvim-treesitter.install").install({
		"angular",
		"prisma",
		"awk",
		"bash",
		"c",
		"cpp",
		"css",
		"csv",
		"dap_repl",
		"dockerfile",
		"fish",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"html",
		"http",
		"javascript",
		"xml",
		"jq",
		"json",
		"jsonc",
		"lua",
		"luap",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"regex",
		"ruby",
		"scheme",
		"scss",
		"sql",
		"toml",
		"typescript",
		"templ",
		"vim",
		"vimdoc",
		"vue",
		"yaml",
	})

	vim.treesitter.language.register("markdown", "octo")

	-- nvim-treesitter-textobjects main branch: explicit setup + keymaps.
	require("nvim-treesitter-textobjects").setup({
		select = { lookahead = true },
		move = { set_jumps = true },
	})

	local sel = require("nvim-treesitter-textobjects.select")
	local move = require("nvim-treesitter-textobjects.move")

	-- SELECT keymaps
	local select_maps = {
		["af"] = { "@function.outer", "textobjects" },
		["if"] = { "@function.inner", "textobjects" },
		["ac"] = { "@call.outer", "textobjects" },
		["ic"] = { "@call.inner", "textobjects" },
		["aC"] = { "@class.outer", "textobjects" },
		["iC"] = { "@class.inner", "textobjects" },
		["ib"] = { "@parameter.inner", "textobjects" },
		["ab"] = { "@parameter.outer", "textobjects" },
		["iB"] = { "@block.inner", "textobjects" },
		["aB"] = { "@block.outer", "textobjects" },
		["id"] = { "@block.inner", "textobjects" },
		["ad"] = { "@block.outer", "textobjects" },
		["il"] = { "@loop.inner", "textobjects" },
		["al"] = { "@loop.outer", "textobjects" },
		["ia"] = { "@attribute.inner", "textobjects" },
		["aa"] = { "@attribute.outer", "textobjects" },
	}
	for key, args in pairs(select_maps) do
		vim.keymap.set({ "x", "o" }, key, function()
			sel.select_textobject(args[1], args[2])
		end)
	end

	-- MOVE keymaps
	local function mmap(lhs, fn, query, group)
		vim.keymap.set({ "n", "x", "o" }, lhs, function()
			fn(query, group or "textobjects")
		end)
	end

	-- goto next start
	mmap("]f", move.goto_next_start, "@function.inner")
	mmap("]e", move.goto_next_start, "@function.outer")
	mmap("]b", move.goto_next_start, "@parameter.outer")
	mmap("]d", move.goto_next_start, "@block.inner")
	mmap("]a", move.goto_next_start, "@attribute.inner")
	mmap("]s", move.goto_next_start, "@local.scope", "locals")
	mmap("]w", move.goto_next_start, "@class.outer")

	-- goto next end
	mmap("]F", move.goto_next_end, "@function.inner")
	mmap("]E", move.goto_next_end, "@function.outer")
	mmap("]B", move.goto_next_end, "@parameter.outer")
	mmap("]D", move.goto_next_end, "@block.inner")
	mmap("]A", move.goto_next_end, "@attribute.inner")
	mmap("]S", move.goto_next_end, "@local.scope", "locals")
	mmap("]W", move.goto_next_end, "@class.outer")

	-- goto previous start
	mmap("[f", move.goto_previous_start, "@function.inner")
	mmap("[e", move.goto_previous_start, "@function.outer")
	mmap("[b", move.goto_previous_start, "@parameter.outer")
	mmap("[d", move.goto_previous_start, "@block.inner")
	mmap("[a", move.goto_previous_start, "@attribute.inner")
	mmap("[s", move.goto_previous_start, "@local.scope", "locals")
	mmap("[w", move.goto_previous_start, "@class.outer")

	-- goto previous end
	mmap("[F", move.goto_previous_end, "@function.inner")
	mmap("[E", move.goto_previous_end, "@function.outer")
	mmap("[B", move.goto_previous_end, "@parameter.outer")
	mmap("[D", move.goto_previous_end, "@block.inner")
	mmap("[A", move.goto_previous_end, "@attribute.inner")
	mmap("[S", move.goto_previous_end, "@local.scope", "locals")
	mmap("[W", move.goto_previous_end, "@class.outer")
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		config = config,
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
			},
			"nvim-treesitter/nvim-treesitter-context",
			{
				"LiadOz/nvim-dap-repl-highlights",
				config = true,
			},
			{
				"bennypowers/template-literal-comments.nvim",
				config = function()
					pcall(require("template-literal-comments").setup, {})
				end,
			},
		},
	},
}
