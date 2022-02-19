local ok, cmp = as.safe_require("cmp")
if not ok then
	return
end

cmp.setup({
	preselect = cmp.PreselectMode.None,
	formatting = {
		format = function(entry, item)
			item.kind = as.style.lsp.kind[item.kind]
			item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[Api]",
				luasnip = "[Snip]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return item
		end,
	},
	documentation = {
		border = as.style.lsp.border,
	},
	mapping = {
		["<C-e>"] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
		["<C-y>"] = cmp.mapping.complete(),
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
		{ name = "path", priority_weight = 110, keyword_length = 3 },
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})
