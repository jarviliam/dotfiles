local ret, luasnip = pcall(require, "luasnip")
if not ret then
	return
end

require("luasnip/loaders/from_vscode").load()
