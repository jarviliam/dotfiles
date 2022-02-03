local M = {}

M.setup = function()
	local ok = pcall(require, "dap")
	if not ok then
		vim.api.nvim_err_writeln("err: dap not found")
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
		ok = pcall(require, fname)
		if not ok then
			vim.api.nvim_err_writeln(string.format("dap: could not find the conf file of %q", l))
		end
	end
end

return M
