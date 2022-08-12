local M = {}

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

---Common format-on-save for lsp servers that implements formatting
---@param client table
---@param buf integer
function M.fmt_on_save(client, buf)
  vim.api.nvim_err_writeln("Not")
end

return M
