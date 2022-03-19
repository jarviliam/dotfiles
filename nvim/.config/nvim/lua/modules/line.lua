local ok, lualine = as.safe_require("lualine")
if not ok then
	return
end

local sections = {
	lualine_a = { "mode" },
	lualine_b = { { "branch" }, { "diff", colored = false } },
	lualine_c = {
		{ "filename", file_status = true },
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
	},
	lualine_x = { "filetype", "encoding", "fileformat" },
	lualine_y = { "progress" },
	lualine_z = { "location" },
}
lualine.setup({
	sections = sections,
	options = {
		theme = "everforest",
		--theme = "nightfox",
	},
	extensions = { "fugitive", "nvim-tree", "quickfix" },
})
