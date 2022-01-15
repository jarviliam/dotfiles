if not pcall(require, "nvim-treesitter") then
	return
end

-- M1 Chip fails to compile Haskall Parser
require("nvim-treesitter.install").compilers = { "gcc-11" }

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = { enable = true },
	incremental_selection = {
		enable = true,
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
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["uc"] = "@comment.outer",
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
