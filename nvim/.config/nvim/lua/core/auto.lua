local bmap = require("keymap").bmap

vim.api.nvim_exec(
	[[
augroup vimrc -- Ensure all autocmds are cleared
autocmd!
augroup end
]],
	""
)

as.augroup("TextYankHighlight", {
	{
		events = { "TextYankPost" },
		targets = { "*" },
		command = function()
			vim.highlight.on_yank({
				timeout = 500,
			})
		end,
	},
})

---Clears cmdline after a few seconds
---@return function
local function clear_cmd()
	local timer
	return function()
		if timer then
			timer:stop()
		end
		timer = vim.defer_fn(function()
			if vim.fn.mode() == "n" then
				vim.cmd([[echon '']])
			end
		end, 10000)
	end
end

as.augroup("ClearCommandMessages", {
	{
		events = { "CmdlineLeave", "CmdlineChanged" },
		targets = { ":" },
		command = clear_cmd(),
	},
})

as.augroup("VimrcIncSearchHighlight", {
	{
		events = { "CmdlineEnter" },
		targets = { "[/\\?]" },
		command = ":set hlsearch  | redrawstatus",
	},
	{
		events = { "CmdlineLeave" },
		targets = { "[/\\?]" },
		command = ":set nohlsearch | redrawstatus",
	},
})

as.augroup("ExternalCommands", {
	{
		events = { "BufEnter" },
		targets = { "*.png,*.jpg,*.gif" },
		command = function()
			vim.cmd(string.format('silent! "%s | :bw"', vim.g.open_command .. " " .. vim.fn.expand("%")))
		end,
	},
})

local quick_close_filetypes = {
	"help",
	"qf",
	"netrw",
	"LuaTree",
	"tsplayground",
	"git-status",
	"dap-float",
	"codelldb",
	"repl",
}

as.augroup("QuickClose", {
	{
		events = { "FileType" },
		targets = { "*" },
		command = function()
			local is_readonly = (vim.bo.readonly or not vim.bo.modifiable) and vim.fn.hasmapto("q", "n") == 0

			local is_eligible = vim.bo.buftype ~= ""
				or is_readonly
				or vim.wo.previewwindow
				or vim.tbl_contains(quick_close_filetypes, vim.bo.filetype)

			if is_eligible then
				bmap("q", "<cmd>close<CR>", 0)
			end
		end,
	},
})

as.augroup("Utilities", {
	{
		-- @source: https://vim.fandom.com/wiki/Use_gf_to_open_a_file_via_its_URL
		events = { "BufReadCmd" },
		targets = { "file:///*" },
		command = function()
			vim.cmd(string.format("bd!|edit %s", vim.uri_from_fname("<afile>")))
		end,
	},
})
