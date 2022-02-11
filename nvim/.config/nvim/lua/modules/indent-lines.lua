local ok, indent = as.safe_require("indent_blankline")
if not ok then
	return
end
indent.setup({
	char = "|",
	buftype_exclude = {
		"terminal",
		"help",
		"vimwiki",
		"startify",
		"man",
		"git",
		"packer",
		"gitmessengerpopup",
		"diagnosticpopup",
		"markdown",
		"lspinfo",
	},
	show_current_context = true,
})
