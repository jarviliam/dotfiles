require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	ignore_install = {},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = { enable = true },
	rainbow = { -- for  windwp/nvim-autopairs
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 2000, -- Do not enable for files with more than 1000 lines, int
		colors = {
			"#ebcb8b",
			"#a3be8c",
			"#88c0d0",
			"#6ea1ec",
			"#b48ead",
			"#df717a",
			"#d08770",
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-n>",
			node_incremental = "<C-n>",
			scope_incremental = "<C-s>",
		},
	},
	autopairs = { enable = true },
})
