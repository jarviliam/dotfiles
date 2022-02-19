local M = {}

-- TODO: Picker for Telescope that changes lualine
function M.changeTheme() end

function M.clear_buffers()
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

function M.fmt_on_save(client)
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

return M
