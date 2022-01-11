local lualine = require("lualine")

local sections = {
	lualine_a = { "mode" },
	lualine_b = { "branch" },
	lualine_c = {
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
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
	lualine_y = { "filename" },
	lualine_z = { "location" },
}
lualine.setup({
	sections = sections,
	options = {
		theme = "everforest",
		extensions = { "fugitive" },
	},
})
