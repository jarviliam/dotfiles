---Setup Keymaps for clients
---@param _ table lsp client

local function default_onattach(client, buf)
  require("modules.lsp.keys").setup(client, buf)
end

local yaml = {
  schemaStore = {
    enable = true,
    url = "https://www.schemastore.org/api/json/catalog.json",
  },
  schemas = {
    kubernetes = "*.yaml",
    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
    ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
    ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
    ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
    ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
    ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
    ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
  },
  format = { enabled = false },
  validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
  completion = true,
  hover = true,
}

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

-- Setup for lsp servers. Requires lspconfig
-- @param name string LSPServer name
-- @paran options table
function M.init(opts)
  if opts == nil or opts == {} then
    opts = { debug = false }
  end

  setup_borders(opts)
  require("modules.lsp.diagnostics").setup()
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
  local flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 200,
  }
  local default_opts = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = flags,
    settings = { yaml = yaml },
  }

  options = vim.tbl_extend("force", default_opts, options or {})
  local ok, lspconfig = as.safe_require("lspconfig")
  if not ok then
    return
  end

  lspconfig[name].setup(options)
end

return M
