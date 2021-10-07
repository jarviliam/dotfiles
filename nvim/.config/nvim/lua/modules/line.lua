local lualine = require("lualine")

local sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch" },
	lualine_c = { "filename" },
	lualine_x = {
		{
			"diagnostics",
			sources = { "nvim_lsp" },
			color_info = "#83a598",
			symbols = {
				error = " ",
				warn = " ",
				hint = " ",
				info = " ",
			},
		},
		"filetype",
	},
	lualine_y = { "progress" },
	lualine_z = { "location" },
}
lualine.setup({
	sections = sections,
	options = {
		theme = "everforest",
		extensions = { "fugitive" },
	},
})
