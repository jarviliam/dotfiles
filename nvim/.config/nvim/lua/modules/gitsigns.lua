local nmap = require("keymap").nmap
local ok, gitsigns = as.safe_require("gitsigns")
if not ok then
	return
end

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	word_diff = false,
	numhl = false,
	linehl = false,
	watch_gitdir = {
		interval = 1000,
	},
	on_attach = function()
		nmap("<leader>hp", gitsigns.preview_hunk, { desc = "gitsigns: preview hunk" }) -- preview hunk
		nmap("<leader>hb", gitsigns.blame_line, { desc = "gitsigns: blame current line" }) -- git blame
		nmap("<leader>hr", gitsigns.reset_hunk, { desc = "gitsigns: reset hunk" }) -- reset hunk
		nmap("<leader>hR", gitsigns.reset_buffer, { desc = "gitsigns: reset buffer" }) -- reset buffer
		nmap("<leader>hu", gitsigns.undo_stage_hunk, { desc = "gitsigns: undo stage" }) -- undo last stage hunk
		nmap("<leader>hs", gitsigns.stage_hunk, { desc = "gitsigns: stage" }) -- git stage hunk
		nmap("<leader>hS", gitsigns.stage_buffer, { desc = "gitsigns: stage buffer" }) -- git stage buffer
		nmap("[_", gitsigns.prev_hunk, { desc = "gitsigns: go to prev hunk" }) -- previous hunk
		nmap("]_", gitsigns.next_hunk, { desc = "gitsigns: go to next hunk" }) -- next hunk
		nmap("<leader>hq", function()
			gitsigns.setqflist("all")
		end, { desc = "gitsigns: list modified in quickfix" })
	end,
	preview_config = { border = "rounded" },
})
