---@diagnostic disable: undefined-field
local source_mapping = {
	nvim_lsp = "[LSP]",
	nvim_lua = "[LUA]",
	luasnip = "[SNIP]",
	buffer = "[BUF]",
	path = "[PATH]",
	treesitter = "[TREE]",
	["vim-dadbod-completion"] = "[DB]",
}

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end

	local line, col = unpack(vim.api.nvim_win_get_cursor(0))

	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local config = function()
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp_tailwind = require("cmp-tailwind-colors")
	local luasnip = require("luasnip")
	local autocomplete_group = vim.api.nvim_create_augroup("dadbod-autocomplete", { clear = true })

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "sql", "mysql", "plsql" },
		callback = function()
			cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
		end,
		group = autocomplete_group,
	})

	cmp.setup({
		enabled = function()
			return require("util.cmp").is_enabled()
		end,

		preselect = cmp.PreselectMode.Item,
		keyword_length = 2,

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		view = { docs = { auto_open = true } },

		mapping = {
			["<C-y>"] = cmp.mapping(
				cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				{ "i", "c" }
			),
			["<C-n>"] = cmp.mapping.select_next_item({
				behavior = cmp.ConfirmBehavior.Insert,
			}),
			["<C-p>"] = cmp.mapping.select_prev_item({
				behavior = cmp.ConfirmBehavior.Insert,
			}),
			["<C-b>"] = cmp.mapping.scroll_docs(-5),
			["<C-f>"] = cmp.mapping.scroll_docs(5),
			["<C-q>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				elseif cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["K"] = cmp.mapping(function(fallback)
				if cmp.visible_docs() then
					cmp.close_docs()
				elseif cmp.visible() then
					cmp.open_docs()
				else
					fallback()
				end
			end),
		},

		sources = cmp.config.sources({
			{
				name = "luasnip",
				group_index = 1,
				option = { use_show_condition = true },
				entry_filter = function()
					local context = require("cmp.config.context")
					return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
				end,
			},
			{ name = "nvim_lsp_signature_help" },
			{ name = "copilot" },
			{
				name = "nvim_lsp",
				group_index = 2,
			},
			{
				name = "nvim_lua",
				group_index = 3,
			},
			{
				name = "treesitter",
				keyword_length = 4,
				group_index = 4,
			},
			{
				name = "path",
				keyword_length = 4,
				group_index = 4,
			},
			{
				name = "buffer",
				keyword_length = 3,
				group_index = 5,
				option = {
					get_bufnrs = function()
						local bufs = {}
						for _, win in ipairs(vim.api.nvim_list_wins()) do
							bufs[vim.api.nvim_win_get_buf(win)] = true
						end
						return vim.tbl_keys(bufs)
					end,
				},
			},
			{
				name = "lazydev",
				keyword_length = 2,
				group_index = 0,
			},
		}),

		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				ellipsis_char = "...",
				before = function(entry, item)
					cmp_tailwind.format(entry, item)
					return item
				end,
				menu = source_mapping,
			}),
		},

		sorting = {
			priority_weight = 2,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return {
	"hrsh7th/nvim-cmp",
	config = config,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"js-everts/cmp-tailwind-colors",
		},
	},
}
