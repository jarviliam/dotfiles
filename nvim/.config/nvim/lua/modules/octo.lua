local ok, octo = as.safe_require("octo")
if not ok then
	return
end

octo.setup({
	default_remote = { "upstream", "origin", "github" },
	reaction_viewer_hint_icon = "",
	user_icon = " ",
	timeline_marker = " ",
})
local map = vim.keymap.set
map("n", "<leader>oil", "<Cmd>Octo issue list<CR>", { silent = true, desc = "octo : list issues" })
map("n", "<leader>oic", "<Cmd>Octo issue create<CR>", { silent = true, desc = "octo : create issue" })
map("n", "<leader>orl", "<Cmd>Octo repo list<CR>", { silent = true, desc = "octo: list repos" })
map("n", "<leader>opl", "<Cmd>Octo pr list<CR>", { silent = true, desc = "octo: list prs" })
map("n", "<leader>opc", "<Cmd>Octo pr create<CR>", { silent = true, desc = "octo: create pr" })
