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
	numhl = false,
	linehl = false,
	keymaps = {
		noremap = true,
		buffer = true,
	},
	watch_gitdir = {
		interval = 1000,
	},
	current_line_blame = false,
	current_line_blame_opts = { delay = 1000, virt_text_pos = "eol" },
	preview_config = { border = "rounded" },
	diff_opts = { internal = true },
})
