local M = {}

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

function M.isBufferEmpty()
	return vim.fn.empty(vim.fn.expand(":%t")) == 1
end

return M
