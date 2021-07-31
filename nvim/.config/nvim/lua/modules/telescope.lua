local M = {}

M.config = function()
	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--hidden",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			prompt_prefix = "  ",
			selection_caret = "❯ ",
			sorting_strategy = "descending",
			layout_strategy = "horizontal",
			layout_config = { height = 0.75, width = 0.8 },
			file_ignore_patterns = {
				"node_modules",
				"package.json",
				"package-lock.json",
				".mkv",
				".png",
				".jpg",
				".jpeg",
				".webp",
				".pdf",
				".mp3",
				".mp4",
				".m4a",
				".opus",
				".flac",
				".doc",
				".zip",
				".odt",
				".ots",
				".docx",
				".xlsx",
				".xls",
				".pptx",
				".dxvk",
				".rpf",
				".dll",
				".kdbx",
				".exe",
			},
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<CR>"] = actions.select_default + actions.center,
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
				},
				n = {
					["<C-c>"] = actions.close,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
			},
		},
		pickers = {
			buffers = {
				sort_lastused = true,
				ignore_current_buffer = true,
				layout_strategy = "horizontal",
				layout_config = { height = 0.5, preview_width = 0.6 },
				show_all_buffers = true,
				mappings = {
					i = {
						["<C-d>"] = "delete_buffer",
					},
					n = {
						["<C-d>"] = "delete_buffer",
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
	pcall(require("telescope").load_extension, "fzf")
end
return M
