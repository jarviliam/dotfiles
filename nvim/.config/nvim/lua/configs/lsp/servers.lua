local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits"
    }
}

local function common_on_attach(client, buffer)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
end

local function make_config()
    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = common_on_attach
    }
end

-- lsp-install
local function setup_servers()
    require "lspinstall".setup()

    -- get all installed servers
    local servers = require "lspinstall".installed_servers()

    for _, server in pairs(servers) do
        local config = make_config()

        config.autostart = true

        -- language specific config
        if server == "typescript" then
            config.filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx"
            }
        end
        if server == "bash" then
            config.filetypes = {"sh", "zsh"}
        end
        if server == "lua" then
            config.settings = lua_settings
        end
        if server == "cpp" then
            config.filetypes = {"c", "cpp"}
        end

        require "lspconfig"[server].setup(config)
    end
end

setup_servers()

