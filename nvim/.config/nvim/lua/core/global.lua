--- store all callbacks in one global table so they are able to survive re-requiring this file
_AsGlobalCallbacks = _AsGlobalCallbacks or {}
DATA_PATH = vim.fn.stdpath("data")

_G.as = {
	_store = _AsGlobalCallbacks,
}

-- TODO: Delete/Refactor

-- inspect
function as.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
	return ...
end
