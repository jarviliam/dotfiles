local bmap = require("keymap").bmap

local function disable_formatting(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

local function setup_autocommands(client, _)
	-- 	if client and client.resolved_capabilities.code_lens then
	-- 		as.augroup("LspCodeLens", {
	-- 			{
	-- 				events = { "BufEnter", "CursorHold", "InsertLeave" },
	-- 				targes = { "<buffer>" },
	-- 				command = vim.lsp.codelens.refresh,
	-- 			},
	-- 		})
	-- 	end
end

---Setup Keymaps for clients
---@param client table lsp client
---@param buf number
local function setup_keymaps(client, buf)
	bmap("<leader>nd", vim.lsp.buf.definition, buf, { desc = "lsp: definition" })
	bmap("<leader>ni", vim.lsp.buf.implementation, buf, { desc = "lsp: implementation" })
	bmap("<leader>nr", vim.lsp.buf.references, buf, { desc = "lsp: references" })
	bmap("<leader>ns", vim.lsp.buf.signature_help, buf, { desc = "lsp: signature help" })
	bmap("<leader>na", vim.lsp.buf.code_action, buf, { desc = "lsp: code action" })
	bmap("<leader>rr", vim.lsp.buf.rename, buf, { desc = "lsp: rename" })
	bmap("<leader>ff", vim.lsp.buf.formatting, buf, { desc = "lsp: format" })
	bmap("<leader>ff", vim.lsp.buf.formatting, buf, { desc = "lsp: format" })
	bmap("?", vim.diagnostic.open_float, buf, { desc = "lsp: diagnostic float" })
	bmap("K", vim.lsp.buf.hover, buf, { desc = "lsp: hover" })
	bmap("]d", vim.diagnostic.goto_next, { desc = "lsp: diagnostic next" })
	bmap("[d", vim.diagnostic.goto_prev, { desc = "lsp: diagnostic prev" })
end

local function default_onattach(client, buf)
	disable_formatting(client)
	setup_autocommands(client)
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
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, options)
	-- signature Help window
	--vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, options)
end

-- Sets up lsp completion capabilities. Requires cmp_nvim_lsp.
local function setup_comp_capabilities()
	M.capabilities = vim.lsp.protocol.make_client_capabilities()

	local ok, cmp_lsp = as.safe_require("cmp_nvim_lsp")
	if ok then
		M.capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
	end
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
	for type, icon in pairs(as.style.lsp.signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

-- Setup for lsp servers. Requires lspconfig
-- @param name string LSPServer name
-- @paran options table
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

-- Init nvim-lsp
-- @param opts table {debug}
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
		"terraform",
		"typescript",
		"vue",
		"yaml",
	}

	for _, l in pairs(languages) do
		local config = string.format("modules.lsp.%s", l)
		as.safe_require(config)
	end
end

return M
