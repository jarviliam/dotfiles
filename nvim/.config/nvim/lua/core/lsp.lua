local M = {
	on_attach = nil,
	capabilities = nil,
}

-- Sets up defaults of border settings of floaters
-- @param options table
-- @return nil
local function setup_borders(options)
	-- Hover window
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, options)
	-- signature Help winow
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, options)
end

-- Sets up lsp completion capabilities. Requires cmp_nvim_lsp.
local function setup_comp_capabilities()
	M.capabilities = vim.lsp.protocol.make_client_capabilities()

	local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
	if not ok then
		vim.api.nvim_err_writeln("lsp: should install cmp_nvim_lsp")
		return
	end
	M.capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

local function setup_diagnostics()
	vim.diagnostic.config({
		signs = true,
		underline = true,
		update_in_insert = false,
		virtual_text = true,
	})
end

local function setup_signs()
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

-- Setup for lsp servers. Requires lspconfig
-- @param name string LSPServer name
function M.setup(name, options)
	local default_opts = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	}

	options = vim.tbl_extend("force", default_opts, options or {})

	local ok, lspconfig = pcall(require, "lspconfig")
	if not ok then
		vim.api.nvim_err_writeln("lspconfig is not installed")
		return
	end

	lspconfig[name].setup(options)
end

-- Init nvim-lsp
-- @param opts table {debug}
function M.init(opts)
	if opts == nil or opts == {} then
		opts = { debug = false }
	end

	setup_borders()
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
		"html",
		"json",
		"lua",
		"python",
		"terraform",
		"typescript",
		"vue",
		"yaml",
	}

	for _, l in pairs(languages) do
		local config = string.format("modules.lsp.%s", l)
		local ok, _ = pcall(require, config)
		if not ok then
			vim.api.nvim_err_writeln(string.format("lsp: could not find the conf file of %q", l))
		end
	end
end

return M
