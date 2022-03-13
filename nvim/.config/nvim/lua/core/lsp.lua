local function disable_formatting(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

---Setup Keymaps for clients
---@param _ table lsp client
---@param bufnr number
local function setup_keymaps(_, bufnr)
	local map = vim.keymap.set
	map(
		"n",
		"<leader>nd",
		vim.lsp.buf.definition,
		{ silent = true, buffer = bufnr, desc = "lsp: definition" }
	)
	map(
		"n",
		"<leader>ni",
		vim.lsp.buf.implementation,
		{ silent = true, buffer = bufnr, desc = "lsp: implementation" }
	)
	map(
		"n",
		"<leader>nr",
		vim.lsp.buf.references,
		{ silent = true, buffer = bufnr, desc = "lsp: references" }
	)
	map(
		"n",
		"<c-k>",
		vim.lsp.buf.signature_help,
		{ silent = true, buffer = bufnr, desc = "lsp: signature help" }
	)
	map(
		"n",
		"<leader>na",
		vim.lsp.buf.code_action,
		{ silent = true, buffer = bufnr, desc = "lsp: code action" }
	)
	map(
		"n",
		"<leader>rr",
		vim.lsp.buf.rename,
		{ silent = true, buffer = bufnr, desc = "lsp: rename" }
	)
	map(
		"n",
		"<leader>ff",
		vim.lsp.buf.formatting,
		{ silent = true, buffer = bufnr, desc = "lsp: format" }
	)
	map(
		"n",
		"<leader>ff",
		vim.lsp.buf.formatting,
		{ silent = true, buffer = bufnr, desc = "lsp: format" }
	)
	map(
		"n",
		"K",
		vim.lsp.buf.hover,
		{ silent = true, buffer = bufnr, desc = "lsp: hover" }
	)
	-- Goto previous/next diagnostic warning/error
	map(
		"n",
		"g[",
		vim.diagnostic.goto_prev,
		{ silent = true, buffer = bufnr, desc = "lsp: diag prev" }
	)
	map(
		"n",
		"g]",
		vim.diagnostic.goto_next,
		{ silent = true, buffer = bufnr, desc = "lsp: diag next" }
	)
	map(
		"n",
		"<leader>F",
		vim.lsp.buf.formatting,
		{ silent = true, buffer = bufnr, desc = "lsp: format" }
	)
	map(
		"v",
		"<leader>F",
		vim.lsp.buf.range_formatting,
		{ silent = true, buffer = bufnr }
	)
end

local function default_onattach(client, buf)
	disable_formatting(client)
	setup_keymaps(client, buf)
end

local M = {
	on_attach = default_onattach,
	capabilities = nil,
}

-- Sets up defaults of border settings of floaters
-- @param options table
-- @return nil
local function setup_borders(options)
	-- Hover window
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		vim.lsp.handlers.hover,
		options
	)
	-- signature Help window
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{
			border = "rounded",
		}
	)
end

-- Sets up lsp completion capabilities. Requires cmp_nvim_lsp.
local function setup_comp_capabilities()
	M.capabilities = vim.lsp.protocol.make_client_capabilities()

	local ok, cmp_lsp = as.safe_require("cmp_nvim_lsp")
	if ok then
		M.capabilities = cmp_lsp.update_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)
	end
end

local function setup_diagnostics()
	vim.diagnostic.config({
		virtual_text = {
			prefix = "● ", -- '■', '▎', 'x'
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

local function setup_signs()
	for type, icon in pairs(as.style.lsp.signs) do
		local hl = "DiagnosticSign" .. type
		local col = "Diagnostic" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = col })
	end
end

-- Setup for lsp servers. Requires lspconfig
-- @param name string LSPServer name
-- @paran options table
function M.init(opts)
	if opts == nil or opts == {} then
		opts = { debug = false }
	end

	setup_borders(opts)
	setup_signs()
	setup_diagnostics()
	setup_comp_capabilities()

	if opts.debug then
		vim.lsp.set_log_level("debug")
	end

	local languages = {
		"bash",
		"clang",
		"cmake",
		"docker",
		"go",
		"haskell",
		"html",
		"json",
		"lua",
		"python",
		"rust",
		"terraform",
		"typescript",
		"vue",
		"yaml",
	}

	for _, l in pairs(languages) do
		local config = string.format("modules.lsp.%s", l)
		as.safe_require(config)
	end
	vim.cmd(
		[[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({focusable=false})]]
	)
end

-- Init nvim-lsp
-- @param opts table {debug}
function M.setup(name, options)
	local default_opts = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	}

	options = vim.tbl_extend("force", default_opts, options or {})
	local ok, lspconfig = as.safe_require("lspconfig")
	if not ok then
		return
	end

	lspconfig[name].setup(options)
end

return M
