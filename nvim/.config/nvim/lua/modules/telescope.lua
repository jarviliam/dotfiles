local ok, telescope = as.safe_require("telescope")
if not ok then
	return
end

local _, actions = as.safe_require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		scroll_strategy = "cycle",
		color_devicons = true,
		winblend = 0,
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
				["<C-d>"] = actions.delete_buffer,
				["<C-v>"] = actions.select_vertical,

				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,

				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<C-s>"] = actions.send_to_qflist,
				["<C-q>"] = actions.send_selected_to_qflist,
				["<Esc>"] = actions.close,
			},
			n = {
				["<CR>"] = actions.select_default + actions.center,
				["<C-d>"] = actions.delete_buffer,
				["<C-v>"] = actions.select_vertical,

				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,

				["<C-q>"] = actions.send_to_qflist,
				["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

				["<Esc>"] = actions.close,
			},
		},

		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		vimgrep_arguments = {
			"rg",
			"--column",
			"--line-number",
			"--with-filename",
			"--no-heading",
			"--smart-case",
			"--hidden",
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
