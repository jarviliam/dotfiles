local ok, neogit = as.safe_require("neogit")
if not ok then
	return
end

neogit.setup({
	integrations = {
		diffview = true,
	},
})
