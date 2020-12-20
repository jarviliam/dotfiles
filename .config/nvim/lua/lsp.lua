--LSP Configurations
require('completion-config')
local lspconfig = require'lspconfig'
local completion = require('completion')

local custom_attach = function(client)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
    completion.on_attach(client)
end

lspconfig.pyls.setup{on_attach=custom_attach}
lspconfig.cssls.setup{on_attach=custom_attach}
lspconfig.html.setup{on_attach=custom_attach}
lspconfig.cmake.setup{on_attach=custom_attach}
lspconfig.clangd.setup{on_attach=custom_attach}
lspconfig.gopls.setup{on_attach=custom_attach}
lspconfig.sumneko_lua.setup{on_attach=custom_attach}

lspconfig.tsserver.setup({
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx"
    },
    on_attach = custom_attach
  })
