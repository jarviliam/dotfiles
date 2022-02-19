local server = "gopls"

if not as.executable(server) then
	vim.api.nvim_err_writeln(string.format("lsp-server: %q is not installed", server))
	return
end

require("core.lsp").setup(server, {
	flags = {
		debounce_text_changes = 500,
	},
})
