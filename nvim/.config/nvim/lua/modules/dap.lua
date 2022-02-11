local M = {}

M.setup = function()
	local ok = as.safe_require("dap")
	if not ok then
		return
	end
	vim.cmd("autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>")
	local lang = {
		"cpp",
		"go",
		"python",
		"node",
		"lua",
	}
	for _, l in pairs(lang) do
		local fname = string.format("modules.dap.%s", l)
		as.safe_require(fname)
	end
end

return M
