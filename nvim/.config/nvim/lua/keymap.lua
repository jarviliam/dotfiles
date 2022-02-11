local M = {}
local defaultOpts = { silent = true, noremap = true }
---Set Insert Keymap
---@param key string
---@param action string
---@param opts table
M.imap = function(key, action, opts)
	if opts == nil then
		opts = defaultOpts
	end
	vim.api.nvim_set_keymap("i", key, action, opts)
end
---Set normal Keymap
---@param key string
---@param action string
---@param opts table
M.nmap = function(key, action, opts)
	if opts == nil then
		opts = defaultOpts
	end
	vim.api.nvim_set_keymap("n", key, action, opts)
end
---Set Visual Keymap
---@param key string
---@param action string
---@param opts table
M.vmap = function(key, action, opts)
	if opts == nil then
		opts = defaultOpts
	end
	vim.api.nvim_set_keymap("v", key, action, opts)
end

---Set Buffer Keymap
---@param key string
---@param action string
---@param buf number
---@param opts table
M.bmap = function(key, action, buf, opts)
	if opts == nil then
		opts = defaultOpts
	end
	if buf == nil then
		buf = 0
	end
	vim.api.nvim_buf_set_keymap(buf, "n", key, action, opts)
end
return M
