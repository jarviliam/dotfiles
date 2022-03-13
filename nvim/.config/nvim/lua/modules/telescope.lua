local ok, telescope = as.safe_require("telescope")
if not ok then
	return
end

local _, actions = as.safe_require("telescope.actions")
local _, builtin = as.safe_require("telescope.builtin")
local trouble = require("trouble.providers.telescope")
local map = vim.keymap.set

telescope.setup({
	defaults = {
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		scroll_strategy = "cycle",
		color_devicons = true,
		winblend = 5,
		layout_strategy = "flex",
		layout_config = {
			width = 0.95,
			height = 0.85,
			prompt_position = "top",

			horizontal = {
				width = 0.9,
				preview_cutoff = 60,
				preview_width = function(_, cols, _)
					if cols > 200 then
						return math.floor(cols * 0.7)
					else
						return math.floor(cols * 0.6)
					end
				end,
			},
			vertical = {
				width = 0.75,
				height = 0.85,
				preview_height = 0.4,
				mirror = true,
			},
			flex = {
				flip_columns = 120,
			},
		},
		mappings = {
			i = {
				["<C-v>"] = actions.select_vertical,

				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,

				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<C-t>"] = trouble.open_with_trouble,
				["<Esc>"] = actions.close,
			},
			n = {
				["<CR>"] = actions.select_default + actions.center,
				["<C-d>"] = actions.delete_buffer,
				["<C-v>"] = actions.select_vertical,

				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,

				["<C-t>"] = trouble.open_with_trouble,

				["<Esc>"] = actions.close,
			},
		},

		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["<C-d>"] = actions.delete_buffer,
				},
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})
local function curbuf()
	local opts = require("telescope.themes").get_dropdown({
		winblend = 10,
		border = true,
		previewer = false,
		shorten_path = false,
	})
	builtin.current_buffer_fuzzy_find(opts)
end
local function funcsel()
	local opts = require("telescope.themes").get_dropdown({
		symbols = "function",
		winblend = 10,
		border = true,
		previewer = false,
		shorten_path = false,
	})
	builtin.lsp_document_symbols(opts)
end

map("n", "<leader>/", ":Telescope live_grep theme=get_ivy<CR>")
map("n", "<leader>nf", builtin.fd, { silent = true, desc = "telescope: fd" })
map("n", "<leader>ng", builtin.git_files, { silent = true, desc = "telescope: git files" })
map("n", "<leader><TAB>", builtin.buffers, { silent = true, desc = "telescope: buffers" })
map("n", "<leader>?", builtin.help_tags, { silent = true, desc = "telescope: help" })
map("n", "<leader>nz", ":Telescope quickfix<CR>")
map("n", "<leader>nx", ":Telescope loclist<CR>")
map("n", "<leader>nv", funcsel, { silent = true, desc = "telescope: buffer fuzzy" })
map("n", "<leader>nb", curbuf, { silent = true, desc = "telescope: buffer fuzzy" })
map("n", "<leader>hd", builtin.keymaps, { silent = true, desc = "telescope: keymap" })
map("n", "<leader>hc", builtin.colorscheme, { silent = true, desc = "telescope: colours" })

map("n", "<leader>d.", ":Telescope dap list_breakpoints<CR>")
