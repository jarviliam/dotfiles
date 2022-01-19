local ok, luasnip = pcall(require, "luasnip")
if not ok then
	vim.api.nvim_err_write("err: no luasnip")
	return
end

--luasnip.loaders.from_vscode.load()
require("luasnip/loaders/from_vscode").load()
