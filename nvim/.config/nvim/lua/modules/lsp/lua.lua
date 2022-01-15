local server = "lua-language-server"

if vim.fn.executable(server) == 0 then
	vim.api.nvim_err_writeln(string.format("lsp-server: %q is not installed", server))
	return
end

local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, 'lua/?.lua')
table.insert(lua_rtp, 'lua/?/init.lua')

require("core.lsp").setup("sumneko_lua", {
	settings = {
		Lua = {
            runtime = {
                version = 'LuaJIT',
                path = lua_rtp,
            },
			diagnostics = {
				globals = { "vim" },
			},
            workspace = {
                -- Neovim runtime
                library= vim.api.nvim_get_runtime_file('',true)
            }
		},
	},
})
