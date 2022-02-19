local M = {}
local defaultOpts = { silent = true, noremap = true }

---Set Insert Keymap
---@param key string
---@param action string
---@param opts table
M.imap = function(key, action, opts)
	opts = vim.tbl_extend("force", defaultOpts, opts or {})
	if type(action) == "function" then
		vim.keymap.set("i", key, action, opts)
	else
		vim.api.nvim_set_keymap("i", key, action, opts)
	end
end
---Set normal Keymap
---@param key string
---@param action string
---@param opts table
M.nmap = function(key, action, opts)
	opts = vim.tbl_extend("force", defaultOpts, opts or {})
	if type(action) == "function" then
		vim.keymap.set("n", key, action, opts)
	else
		vim.api.nvim_set_keymap("n", key, action, opts)
	end
end
---Set Visual Keymap
---@param key string
---@param action string
---@param opts table
M.vmap = function(key, action, opts)
	opts = vim.tbl_extend("force", defaultOpts, opts or {})
	if type(action) == "function" then
		vim.keymap.set("v", key, action, opts)
	else
		vim.api.nvim_set_keymap("v", key, action, opts)
	end
end

---Set Buffer Keymap
---@param key string
---@param action string
---@param buf number
---@param opts table
M.bmap = function(key, action, buf, opts)
	opts = vim.tbl_extend("force", defaultOpts, opts or {})
	if buf == nil then
		buf = 0
		opts.buffer = 0
	end
	if type(action) == "function" then
		vim.keymap.set("n", key, action, opts)
	else
		vim.api.nvim_buf_set_keymap(buf, "n", key, action, opts)
	end
end
return M
