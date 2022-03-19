local pack_use = function()
	local use = require("packer").use
	use("wbthomason/packer.nvim")
	-----------------------------------------------------------------------------// Required by others {{{1
	-----------------------------------------------------------------------------//
	use({ "nvim-lua/plenary.nvim" })
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	})
	use({ "lewis6991/impatient.nvim", as = "impatient" })
	-----------------------------------------------------------------------------//
	-- LSP, Autocomplete and snippets {{{1
	-----------------------------------------------------------------------------//
	use({
		"neovim/nvim-lspconfig",
		after = "cmp-nvim-lsp",
		config = function()
			require("core.lsp").init({ debug = false, border = "rounded" })
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		},
		config = 'require("modules.compe")',
	})
	use({
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = 'require("modules.luasnip")',
		requires = "rafamadriz/friendly-snippets",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = 'require("modules.null")',
	})

	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("modules.neogen")
		end,
	})

	-----------------------------------------------------------------------------//
	-- Telescope {{{1
	-----------------------------------------------------------------------------//
	use({
		"nvim-telescope/telescope.nvim",
		event = "CursorHold",
		cmd = "Telescope",
		config = function()
			require("modules.telescope")
		end,
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		after = "telescope.nvim",
		run = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
			vim.keymap.set(
				"n",
				"<leader>no",
				"<Cmd>TroubleToggle document_diagnostics<CR>",
				{ silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>nO",
				"<Cmd>TroubleToggle workspace_diagnostics<CR>",
				{ silent = true }
			)
		end,
	})

	-----------------------------------------------------------------------------//
	-- Treesitter {{{1
	-----------------------------------------------------------------------------//
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "CursorHold",
		config = 'require("modules.treesitter")',
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = { "nvim-treesitter" },
	})
	use({
		"nvim-treesitter/nvim-treesitter-refactor",
		after = { "nvim-treesitter" },
	})
	use({
		"nvim-treesitter/playground",
		after = "nvim-treesitter",
		cmd = { "TSPlaygroundToggle" },
	})
	use({ "windwp/nvim-ts-autotag", after = { "nvim-treesitter" } })

	-----------------------------------------------------------------------------//
	-- Utils {{{1
	-----------------------------------------------------------------------------//
	use({
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 15
			vim.g.startuptime_exe_args = { "+let g:auto_session_enabled = 0" }
		end,
	})
	-----------------------------------------------------------------------------//
	-- Text Objects and Editing {{{1
	-----------------------------------------------------------------------------//
	use({
		"ggandor/lightspeed.nvim",
		as = "lightspeed",
		requires = { "tpope/vim-repeat", as = "repeat" },
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tpope/vim-surround")
	use({
		"windwp/nvim-autopairs",
		event = "InsertCharPre",
		config = 'require("modules.autopairs")',
		after = "nvim-cmp",
	})

	-----------------------------------------------------------------------------//
	-- Git {{{1
	-----------------------------------------------------------------------------//
	use({
		"TimUntersberger/neogit",
		config = 'require("modules.git")',
	})
	use({
		"pwntester/octo.nvim",
		as = "octo",
		config = 'require("modules.octo")',
	})
	use({
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		module = "diffview",
		keys = "<localleader>gd",
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				key_bindings = {
					file_panel = { q = "<Cmd>DiffviewClose<CR>" },
					view = { q = "<Cmd>DiffviewClose<CR>" },
				},
			})
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = 'require("modules.gitsigns")',
		after = "plenary.nvim",
	})

	-----------------------------------------------------------------------------//
	-- Debugger {{{1
	-----------------------------------------------------------------------------//
	use({ "mfussenegger/nvim-dap" })
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup({
				sidebar = { size = 80 },
				tray = { size = 10 },
				floating = {
					max_width = 0.9,
					max_height = 0.5,
					border = vim.g.border_chars,
				},
			})
		end,
	})
	use({ "jbyuki/one-small-step-for-vimkind", requires = "nvim-dap" })
	use({
		"mfussenegger/nvim-dap-python",
		requires = { "mfussenegger/nvim-dap" },
		config = require("modules.dap").setup(),
	})

	use({
		"nvim-telescope/telescope-dap.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		after = "telescope.nvim",
		config = function()
			require("telescope").load_extension("dap")
		end,
	})

	-----------------------------------------------------------------------------//
	-- General plugins {{{1
	-----------------------------------------------------------------------------//

	use({
		"akinsho/toggleterm.nvim",
		as = "toggleterm",
		config = function()
			require("modules.terminal")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		event = "BufEnter",
		config = 'require("modules.line")',
	})

	use({
		"j-hui/fidget.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "circle_halves",
				},
			})
		end,
	})

	use("tpope/vim-eunuch")

	use({
		"folke/todo-comments.nvim",
		as = "todo_comments",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("modules.todo")
		end,
	})

	use({
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = "vim.g.undotree_WindowLayout = 2",
	})

	use({
		"mhinz/vim-startify",
		as = "startify",
		setup = function()
			vim.g.startify_fortune_use_unicode = 1
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = 'require("modules.indent-lines")',
	})

	use({
		"rcarriga/nvim-notify",
		as = "notify",
		config = function()
			-- NOTE: Use require'notify'.notify as the default notification UI. <kunzaatko> --
			vim.notify = require("notify")
		end,
	})

	use({
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({ hide_cursor = false })
		end,
	})
	use({ "folke/lua-dev.nvim", as = "lua-dev" })

	-----------------------------------------------------------------------------//
	-- Themes {{{1
	-----------------------------------------------------------------------------//
	use("sainnhe/sonokai")
	use("sainnhe/gruvbox-material")
	use("sainnhe/everforest")
	use("savq/melange")
	use("EdenEast/nightfox.nvim")
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup({
				dark_variant = "moon",
				bold_vert_split = true,
				disable_float_background = true,
			})
			--vim.cmd([[ colorscheme rose-pine ]])
		end,
	})
end
-- }}}

local fn, execute = vim.fn, vim.api.nvim_command
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"

local function load_plugins()
	local pack = require("packer")
	pack.init({ compile_path = compile_path, git = { clone_timeout = 600 } })
	pack.startup({
		function()
			pack_use()
		end,
	})
end

if fn.empty(fn.glob(install_path)) > 0 then
	execute(
		"!git clone https://github.com/wbthomason/packer.nvim " .. install_path
	)
	load_plugins()
	require("packer").sync()
else
	load_plugins()
end
-- vim:foldmethod=marker
