local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.api.nvim_err_write("lualine: not found")
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
	lualine_x = { "lsp_progress", "filetype", "encoding", "fileformat" },
	lualine_y = { "progress" },
	lualine_z = { "location"},
}
lualine.setup({
	sections = sections,
	options = {
		theme = "everforest",
	},
	extensions = { "fugitive", "nvim-tree" },
})
