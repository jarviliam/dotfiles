if not pcall(require, "nvim-treesitter") then
	return
end

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
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["aC"] = "@comment.outer",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["<Leader><Leader>ab"] = "@block.outer",
				["<Leader><Leader>ib"] = "@block.inner",
				["<Leader><Leader>af"] = "@function.outer",
				["<Leader><Leader>if"] = "@function.inner",
				["<Leader><Leader>ao"] = "@class.outer",
				["<Leader><Leader>io"] = "@class.inner",
				["<Leader><Leader>aC"] = "@call.outer",
				["<Leader><Leader>iC"] = "@call.inner",
				["<Leader><Leader>ac"] = "@conditional.outer",
				["<Leader><Leader>ic"] = "@conditional.inner",
				["<Leader><Leader>al"] = "@loop.outer",
				["<Leader><Leader>il"] = "@loop.inner",
				["<Leader><Leader>ap"] = "@parameter.outer",
				["<Leader><Leader>ip"] = "@parameter.inner",
				["<Leader><Leader>is"] = "@scopename.inner",
				["<Leader><Leader>as"] = "@statement.outer",
			},
		},
	},
})
