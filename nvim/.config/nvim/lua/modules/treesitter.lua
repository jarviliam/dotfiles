-- M1 Chip fails to compile Haskall Parser
--require("nvim-treesitter.install").compilers = { "gcc-11" }

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	incremental_selection = {
		enable = false,
		keymaps = {
			init_selection = "<leader>si",
			node_incremental = "<leader>sn",
			node_decremental = "<leader>sN",
			scope_incremental = "<leader>sc",
		},
	},
	autopairs = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
				["<leader>f"] = "@function.outer",
				["<leader>e"] = "@element",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
				["<leader>F"] = "@function.outer",
				["<leader>E"] = "@element",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
	playground = {
		enable = true,
		updatetime = 25,
		persist_queries = false,
	},
	refactor = {
		highlight_definitions = { enable = true },
	},
})
