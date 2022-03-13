local ok, neogit = as.safe_require("neogit")
if not ok then
	return
end
local map = vim.keymap.set

neogit.setup({
  disable_builtin_notifications = true,
	integrations = {
		diffview = true,
	},
})
map("n", "<leader>gs", neogit.open, { silent = true, desc = "neogit: open" })
