if not pcall(require, "telescope") then
	return
end

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local sorters = require("telescope.sorters")
local themes = require("telescope.themes")

local set_prompt_to_entry_value = function(prompt_bufnr)
	local entry = action_state.get_selected_entry()
	if not entry or not type(entry) == "table" then
		return
	end

	action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

require("telescope").setup({
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
				["<C-x>"] = actions.delete_buffer,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<S-up>"] = actions.preview_scrolling_up,
				["<S-down>"] = actions.preview_scrolling_down,
				["<C-up>"] = actions.preview_scrolling_up,
				["<C-down>"] = actions.preview_scrolling_down,

				["<C-u>"] = actions.move_to_top,
				["<C-d>"] = actions.move_to_middle,
				["<C-b>"] = actions.move_to_top,
				["<C-f>"] = actions.move_to_bottom,

				["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-y>"] = set_prompt_to_entry_value,

				["<C-c>"] = actions.close,
			},
			n = {
				["<CR>"] = actions.select_default + actions.center,
				["<C-d>"] = actions.delete_buffer,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["<S-up>"] = actions.preview_scrolling_up,
				["<S-down>"] = actions.preview_scrolling_down,
				["<C-up>"] = actions.preview_scrolling_up,
				["<C-down>"] = actions.preview_scrolling_down,

				["<C-u>"] = actions.move_to_top,
				["<C-d>"] = actions.move_to_middle,
				["<C-b>"] = actions.move_to_top,
				["<C-f>"] = actions.move_to_bottom,

				["<C-q>"] = actions.send_to_qflist,
				["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

				["<C-c>"] = actions.close,
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

require("telescope").load_extension("fzf")

-- M.config = function()
-- 	local actions = require("telescope.actions")
-- 	require("telescope").setup({
-- 		defaults = {
-- 			vimgrep_arguments = {
-- 				"rg",
-- 				"--hidden",
-- 				"--no-heading",
-- 				"--with-filename",
-- 				"--line-number",
-- 				"--column",
-- 				"--smart-case",
-- 			},
-- 			prompt_prefix = "  ",
-- 			selection_caret = "❯ ",
-- 			sorting_strategy = "descending",
-- 			layout_strategy = "horizontal",
-- 			layout_config = { height = 0.75, width = 0.8 },
-- 			file_ignore_patterns = {
-- 				"node_modules",
-- 				"package.json",
-- 				"package-lock.json",
-- 				".mkv",
-- 				".png",
-- 				".jpg",
-- 				".jpeg",
-- 				".webp",
-- 				".pdf",
-- 				".mp3",
-- 				".mp4",
-- 				".m4a",
-- 				".opus",
-- 				".flac",
-- 				".doc",
-- 				".zip",
-- 				".odt",
-- 				".ots",
-- 				".docx",
-- 				".xlsx",
-- 				".xls",
-- 				".pptx",
-- 				".dxvk",
-- 				".rpf",
-- 				".dll",
-- 				".kdbx",
-- 				".exe",
-- 			},
-- 			mappings = {
-- 				i = {
-- 					["<C-j>"] = actions.move_selection_next,
-- 					["<C-k>"] = actions.move_selection_previous,
-- 					["<CR>"] = actions.select_default + actions.center,
-- 					["<C-n>"] = actions.cycle_history_next,
-- 					["<C-p>"] = actions.cycle_history_prev,
-- 				},
-- 				n = {
-- 					["<C-c>"] = actions.close,
-- 					["<C-j>"] = actions.move_selection_next,
-- 					["<C-k>"] = actions.move_selection_previous,
-- 				},
-- 			},
-- 		},
-- 		pickers = {
-- 			buffers = {
-- 				sort_lastused = true,
-- 				ignore_current_buffer = true,
-- 				layout_strategy = "horizontal",
-- 				layout_config = { height = 0.5, preview_width = 0.6 },
-- 				show_all_buffers = true,
-- 				mappings = {
-- 					i = {
-- 						["<C-d>"] = "delete_buffer",
-- 					},
-- 					n = {
-- 						["<C-d>"] = "delete_buffer",
-- 					},
-- 				},
-- 			},
-- 		},
-- 		extensions = {
-- 			fzf = {
-- 				fuzzy = true, -- false will only do exact matching
-- 				override_generic_sorter = true, -- override the generic sorter
-- 				override_file_sorter = true, -- override the file sorter
-- 				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
-- 			},
-- 		},
-- 	})
-- 	pcall(require("telescope").load_extension, "fzf")
-- end
-- return M
