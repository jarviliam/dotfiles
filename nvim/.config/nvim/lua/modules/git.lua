local ok, neogit = as.safe_require("neogit")
if not ok then
	return
end
local nmap = require("keymap").nmap

neogit.setup({
	integrations = {
		diffview = true,
	},
})
nmap("<leader>gs", neogit.open, { desc = "neogit: open" })
