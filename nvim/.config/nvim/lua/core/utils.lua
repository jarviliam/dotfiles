local cmd = vim.cmd
local fn = vim.fn
local M = {}

function M.hiLink(src, dest)
	cmd("highlight link " .. src .. " " .. dest)
end

-- automatically creates missing directories when saving a file
function M.mkdir()
	local dir = fn.expand("%:p:h")

	if fn.isdirectory(dir) == 0 then
		fn.mkdir(dir, "p")
	end
end

-- delete buffers and preserve window layout.
M.delete_buffer = function()
	local buflisted = fn.getbufinfo({ buflisted = 1 })
	local cur_winnr, cur_bufnr = fn.winnr(), fn.bufnr()
	if #buflisted < 2 then
		cmd("confirm qall")
		return
	end
	for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
		cmd(string.format("%d wincmd w", fn.win_id2win(winid)))
		cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
	end
	cmd(string.format("%d wincmd w", cur_winnr))
	local is_terminal = fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
	cmd(is_terminal and "bd! #" or "silent! confirm bd #")
end

return M
