local ok, gitsigns = as.safe_require("gitsigns")
if not ok then
	return
end

local map = vim.keymap.set
gitsigns.setup({
	signs = {
		add = {
			hl = "GitSignsAdd",
			text = "│",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "│",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "_",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "‾",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "~",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	word_diff = false,
	numhl = false,
	linehl = false,
	watch_gitdir = {
		interval = 1000,
	},
	on_attach = function()
		map(
			"n",
			"<leader>hp",
			gitsigns.preview_hunk,
			{ desc = "gitsigns: preview hunk" }
		) -- preview hunk
		map(
			"n",
			"<leader>hb",
			gitsigns.blame_line,
			{ desc = "gitsigns: blame current line" }
		) -- git blame
		map(
			"n",
			"<leader>hr",
			gitsigns.reset_hunk,
			{ desc = "gitsigns: reset hunk" }
		) -- reset hunk
		map(
			"n",
			"<leader>hR",
			gitsigns.reset_buffer,
			{ desc = "gitsigns: reset buffer" }
		) -- reset buffer
		map(
			"n",
			"<leader>hu",
			gitsigns.undo_stage_hunk,
			{ desc = "gitsigns: undo stage" }
		) -- undo last stage hunk
		map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "gitsigns: stage" }) -- git stage hunk
		map(
			"n",
			"<leader>hS",
			gitsigns.stage_buffer,
			{ desc = "gitsigns: stage buffer" }
		) -- git stage buffer
		map("n", "[_", gitsigns.prev_hunk, { desc = "gitsigns: go to prev hunk" }) -- previous hunk
		map("n", "]_", gitsigns.next_hunk, { desc = "gitsigns: go to next hunk" }) -- next hunk
		map("n", "<leader>hq", function()
			gitsigns.setqflist("all")
		end, { desc = "gitsigns: list modified in quickfix" })
	end,
	preview_config = { border = "rounded" },
})
