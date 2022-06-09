local ok, neogen = as.safe_require("neogen")
if not ok then
	return
end

local map = vim.keymap.set
neogen.setup({ enabled = true })
map(
	"n",
	"<leader>og",
	neogen.generate,
	{ silent = true, desc = "neogen: generate" }
)
map("n", "<leader>of", function()
	neogen.generate({ type = "func" })
end, { silent = true, desc = "neogen: generate function" })
map("n", "<leader>oc", function()
	neogen.generate({ type = "class" })
end, { silent = true, desc = "neogen: generate class" })
