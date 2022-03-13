local server = "lua-language-server"

if vim.fn.executable(server) == 0 then
	vim.api.nvim_err_writeln(string.format("lsp-server: %q is not installed", server))
	return
end

local ok, lua_dev = pcall(require, "lua-dev")
if not ok then
	local lua_rtp = vim.split(package.path, ";")
	table.insert(lua_rtp, "lua/?.lua")
	table.insert(lua_rtp, "lua/?/init.lua")

	vim.api.nvim_err_writeln("err")
	require("core.lsp").setup("sumneko_lua", {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = lua_rtp,
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- Neovim runtime
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	})
	return
end

local luadev = lua_dev.setup({})
require("core.lsp").setup("sumneko_lua", luadev)
