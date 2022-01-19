local g = vim.g

g.vim_tree_special_files = {
	"README.md",
	"LICENSE",
	"Makefile",
	"package.json",
	"package-lock.json",
}

g.nvim_tree_ignore = {
	".git",
	"node_modules",
	".cache",
	"__pycache__",
}

g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
    folder_arrows = 1,
    lsp = 1
}

-- Mostly default mappings
local tree_cb = require("nvim-tree.config").nvim_tree_callback
-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "★",
		staged = "+",
		unmerged = "",
		renamed = "→",
		untracked = "?",
		deleted = "✗",
		ignored = "◌",
	},
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = false,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = true,
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	view = {
		width = 30,
		side = "left",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
				{ key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
				{ key = "<C-v>", cb = tree_cb("vsplit") },
				{ key = "<C-s>", cb = tree_cb("split") },
				{ key = "<C-t>", cb = tree_cb("tabnew") },
				{ key = "<Tab>", cb = tree_cb("preview") },
				{ key = "R", cb = tree_cb("refresh") },
				{ key = "a", cb = tree_cb("create") },
				{ key = "d", cb = tree_cb("remove") },
				{ key = "r", cb = tree_cb("rename") },
				{ key = "<C-r>", cb = tree_cb("full_rename") },
				{ key = "x", cb = tree_cb("cut") },
				{ key = "c", cb = tree_cb("copy") },
				{ key = "p", cb = tree_cb("paste") },
				{ key = "y", cb = tree_cb("copy_name") },
				{ key = "Y", cb = tree_cb("copy_path") },
				{ key = "q", cb = tree_cb("close") },
			},
		},
	},
})
