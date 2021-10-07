local cmp = require("cmp")
local lspkind = require("lspkind")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	formatting = {
		deprecated = false,
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				luasnip = "[Snip]",
				buffer = "[Buffer]",
				path = "[Path]",
				calc = "[Calc]",
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
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if vim.fn["luasnip#jumpable"](-1) == 1 then
				vim.fn.feedkeys(t("<C-R>=luasnip#Jump(-1)<CR>"))
			elseif vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(t("<C-p>"), "n")
			elseif check_back_space() then
				vim.fn.feedkeys(t("<S-tab>"), "n")
			else
				vim.fn.feedkeys(t("<S-tab>"), "n")
			end
		end, {
			"i",
			"s",
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if vim.fn["luasnip#jumpable"](1) == 1 then
				vim.fn.feedkeys(t("<esc>:call luasnip#Jump(1)<CR>"))
			elseif vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(t("<C-n>"), "n")
			elseif check_back_space() then
				vim.fn.feedkeys(t("<tab>"), "n")
			else
				vim.fn.feedkeys(t("<tab>"), "n")
			end
		end, {
			"i",
			"s",
		}),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-Space>"] = cmp.mapping.complete(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	completion = {
		keyword_length = 2,
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "calc" },
	},
})
