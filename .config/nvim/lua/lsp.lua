--LSP Configurations
require('completion-config')
local lspconfig = require'lspconfig'
local completion = require('completion')
local lualine = require('lualine')
local lsp_status = require('lsp-status')

--lsp_status.register_progress()
lualine.sections = {
      lualine_a = { 'mode' },
     lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
    }
lualine.extensions = { 'telescope' }
lualine.status()

local custom_attach = function(client)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
    completion.on_attach(client)
    lsp_status.on_attach(client)

--client.capabilities = vim.tbl_extend('keep', client.capabilities or {}, lsp_status.capabilities)
    --client.capabilities = lsp_status.capabilities
end
lspconfig.pyls.setup{on_attach=custom_attach}
lspconfig.cssls.setup{on_attach=custom_attach}
lspconfig.html.setup{on_attach=custom_attach}
lspconfig.cmake.setup{on_attach=custom_attach}
lspconfig.clangd.setup({on_attach=custom_attach})
lspconfig.gopls.setup{on_attach=custom_attach}
lspconfig.sumneko_lua.setup{on_attach=custom_attach}
lsp_status.status()

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
