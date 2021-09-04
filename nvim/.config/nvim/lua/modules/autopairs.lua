require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
	ignored_next_char = "%w",
	enable_check_bracket_line = true,
	check_ts = true,
	show_ts_warning = true,
})
require("nvim-autopairs.completion.cmp").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` after select function or method item
	auto_select = true, -- automatically select the first item
})
