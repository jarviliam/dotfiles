local M = {}

function M.isBufferEmpty()
	return vim.fn.empty(vim.fn.expand(":%t")) == 1
end

return M
