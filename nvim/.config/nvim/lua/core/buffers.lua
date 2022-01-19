local M = {}
function M.Clear()
	local deleted = 0
	local current = vim.api.nvim_get_current_buf()
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if b ~= current and (vim.api.nvim_buf_get_option(b, "modifiable")) then
			vim.api.nvim_buf_delete(b, {})
			deleted = deleted + 1
		end
	end
	print("Buffers Cleared: " .. deleted)
end

return M
