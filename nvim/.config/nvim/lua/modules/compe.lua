local ok, cmp = pcall(require, "cmp")
if not ok then
	vim.api.nvim_err_writeln("cmp: not found")
	return
end

cmp.setup({
	preselect = cmp.PreselectMode.None,
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[Api]",
				luasnip = "[Snip]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	documentation = {
		border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		},
	},
	mapping = {
		["<C-e>"] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-j>"] = function(fallback)
			if cmp.visible() then
				return cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })(fallback)
			else
				return cmp.mapping.complete({ reason = cmp.ContextReason.Auto })(fallback)
			end
		end,
		["<CR>"] = function(fallback)
			if cmp.visible() then
				return cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })(fallback)
			else
				return fallback()
			end
		end,
	},
	sorting = {
		priority_weight = 100,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	completion = {
		keyword_length = 1,
	},
	sources = {
		{ name = "luasnip", priority_weight = 80 },
		{ name = "nvim_lsp", priority_weight = 100, max_item_count = 15 },
		{ name = "nvim_lua", priority_weight = 90 },
		{ name = "buffer", priority_weight = 70, max_item_count = 5 },
		{ name = "path", priority_weight = 110 },
	},
})
