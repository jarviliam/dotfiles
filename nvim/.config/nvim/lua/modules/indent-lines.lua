require("indent_blankline").setup({
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
