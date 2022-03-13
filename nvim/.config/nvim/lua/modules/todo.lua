local ok, todo = as.safe_require("todo-comments")
if not ok then
	return
end

todo.setup({
	highlight = { keyword = "fg", after = "" },
	keywords = {
		FIX = {
			icon = "? ",
			color = "error",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
		},
		TODO = { icon = "? ", color = "info" },
		HACK = { icon = "? ", color = "warning" },
		WARN = { icon = "? ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = "? ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = "? ", color = "hint", alt = { "INFO" } },
	},
})
vim.keymap.set("n", "<leader>T", "<Cmd>TodoTrouble<CR>", { silent = true })
