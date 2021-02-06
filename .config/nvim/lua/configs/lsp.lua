--LSP Configurations
local lspconfig = require'lspconfig'
local U = require "utils"
local l = '<leader>'

--local completion = require('completion')
--local lsp_status = require('lsp-status')

--Custom Attach
local custom_attach = function(client)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
    --completion.on_attach(client)
end

local servers = {
    "ccls",
    "cmake",
    "clangd",
    "html",
    "gopls",
    "pyls",
    "sumneko_lua",
    "tsserver"
}

--Basic Setups
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup{on_attach=custom_attach}
end

--For More Complex Setups. Do them Individually


--Mappings
U.KeyMap('n',l..'gd', ':lua vim.lsp.buf.definition()<CR>')
U.KeyMap('n',l..'gi', ':lua vim.lsp.buf.implementation()<CR>')
U.KeyMap('n',l..'grf', ':lua vim.lsp.buf.references()<CR>')
U.KeyMap('n',l..'grn', ':lua vim.lsp.buf.rename()<CR>')
U.KeyMap('n',l..'gf', ':lua vim.lsp.buf.formatting()<CR>')
U.KeyMap('n',l..'gsd', ':lua vim.lsp.show_line_diagnostics()<CR>')
U.KeyMap('n',l..'k', ':lua vim.lsp.buf.hover()<CR>')


--LSPSaga
U.KeyMap('n',l..'pd', ':lua require\'lspsaga.provider\'.preview_definition()<CR>')
U.KeyMap('n',l..'cd', ':lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>')
U.KeyMap('n',l..'e[', ':lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>')
U.KeyMap('n',l..'e]', ':lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>')

--Go Imports
  function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
      local result = resp[1].result
      if result and result[1] then
        local edit = result[1].edit
        vim.lsp.util.apply_workspace_edit(edit)
      end
    end

    vim.lsp.buf.formatting()
end
