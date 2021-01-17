--LSP Configurations
require('completion-config')
local lspconfig = require'lspconfig'
local completion = require('completion')
--local lsp_status = require('lsp-status')

require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true } }


--Custom Attach
local custom_attach = function(client)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
    completion.on_attach(client)
end

-- Language Server Setup
lspconfig.pyls.setup{on_attach=custom_attach}
lspconfig.cssls.setup{on_attach=custom_attach}
lspconfig.html.setup{on_attach=custom_attach}
lspconfig.cmake.setup{on_attach=custom_attach}
lspconfig.clangd.setup{on_attach=custom_attach}
lspconfig.gopls.setup{on_attach=custom_attach}
lspconfig.sumneko_lua.setup{on_attach=custom_attach}
lspconfig.tsserver.setup{on_attach = custom_attach}
