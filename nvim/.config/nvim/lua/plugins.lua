local pack_use = function()
	local use = require("packer").use
	use({ "wbthomason/packer.nvim" })
	use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
	-----------------------------------------------------------------------------//
	-- Required by others {{{1
	-----------------------------------------------------------------------------//
	use({ "nvim-lua/plenary.nvim", module = "plenary", event = "BufRead" })
	use({
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	})
	-----------------------------------------------------------------------------//
	-- LSP, Autocomplete and snippets {{{1
	-----------------------------------------------------------------------------//
	use({ "ray-x/lsp_signature.nvim" })

	use({
		"neovim/nvim-lspconfig",
		requires = { "glepnir/lspsaga.nvim" },
		config = function()
			require("lspsaga").init_lsp_saga()
		end,
	})
	use({
		"kabouzeid/nvim-lspinstall",
		after = "nvim-lspconfig",
		config = function()
			require("modules.lsp.servers")
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
		},
		config = "require('modules.compe')",
		after = "LuaSnip",
	})
	use("rafamadriz/friendly-snippets")
	use({ "L3MON4D3/LuaSnip", config = 'require("modules.luasnip")' })

	use({ "saadparwaiz1/cmp_luasnip" })
	use("onsails/lspkind-nvim") -- icons for completion popup
	-----------------------------------------------------------------------------//
	-- Telescope {{{1
	-----------------------------------------------------------------------------//
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim" },
		},
		cmd = "Telescope",
		config = 'require("modules.telescope")',
		opt = true,
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		opt = true,
		run = "make",
	})
	-----------------------------------------------------------------------------//
	-- Treesitter {{{1
	-----------------------------------------------------------------------------//
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufRead",
		config = 'require("modules.treesitter")',
	})
	use({ "nvim-treesitter/playground", after = "nvim-treesitter", cmd = { "TSPlaygroundToggle" }, opt = true })
	use({ "nvim-treesitter/nvim-treesitter-textobjects", after = { "nvim-treesitter" } })

	-----------------------------------------------------------------------------//
	-- Utils {{{1
	-----------------------------------------------------------------------------//
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = 'require("modules.tree")',
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		opt = true,
	})
	-----------------------------------------------------------------------------//
	-- Text Objects and Editing {{{1
	-----------------------------------------------------------------------------//
	use({ "b3nj5m1n/kommentary", config = "require('plugins.kommentary')" })

	use({ "kevinhwang91/nvim-bqf", config = "require('modules.bqf')", ft = "qf" })

	-----------------------------------------------------------------------------//
	-- Git {{{1
	-----------------------------------------------------------------------------//
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = "require('modules.gitsigns')",
		after = "plenary.nvim",
	})
	-----------------------------------------------------------------------------//
	-- General plugins {{{1
	-----------------------------------------------------------------------------//

	use({
		"hoob3rt/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("modules.line")
		end,
	})
	use({
		"mhartington/formatter.nvim",
		cmd = { "Format", "FormatWrite" },
		config = function()
			require("modules.format").config()
		end,
	})

	use("tpope/vim-surround")
	use("tpope/vim-eunuch")
	use("junegunn/gv.vim")

	use({
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = "vim.g.undotree_WindowLayout = 2",
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("modules.autopairs")
		end,
		after = "nvim-cmp",
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
	})
	--Themes
	use("sainnhe/sonokai")
	use("sainnhe/everforest")
	use("shaunsingh/nord.nvim")
	use("lifepillar/gruvbox8")
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
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	load_plugins()
	require("packer").sync()
else
	load_plugins()
end
-- vim:foldmethod=marker
