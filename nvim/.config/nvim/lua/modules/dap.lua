local nmap = require("keymap").nmap
local vmap = require("keymap").vmap
local M = {}

M.setup = function()
	local ok, dap = as.safe_require("dap")
	if not ok then
		return
	end
	local lang = {
		"cpp",
		"go",
		"go_test",
		"python",
		"node",
		"lua",
	}
	for _, l in pairs(lang) do
		local fname = string.format("modules.dap.%s", l)
		as.safe_require(fname)
	end

	local _, dapui = as.safe_require("dapui")

	nmap("<Space>d~", dap.toggle_breakpoint, { desc = "dap: Toggle Breakpoint" })
	nmap("<Space>d-", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
	nmap("<Space>do", dap.continue, { desc = "dap: Continue" })
	nmap("<Space>df", dapui.toggle, { desc = "dapui: Toggle" })
	dap.listeners.after.event_stopped["jarviliam"] = function()
		nmap("<leader>dh", "<cmd>lua require 'dap.ui.widgets'.hover()<CR>")
		vmap("<leader>dh", "<cmd>lua require 'dap.ui.widgets'.visual_hover()<CR>")
		nmap("<leader>dj", dap.step_into, { desc = "dap: Step Into" })
		nmap("<leader>dl", dap.step_over, { desc = "dap: Step Over" })
		nmap("<leader>dk", dap.step_out, { desc = "dap: Step Out" })
		nmap("<leader>dr", dap.restart, { desc = "dap: Restart" })
		nmap("<leader>dn", dap.run_to_cursor, { desc = "dap: Run To Cursor" })
	end
	dap.listeners.before.event_exited["jarviliam"] = function()
		vim.keymap.del({ "n", "v" }, "<leader>dh")
		vim.keymap.del("n", "<leader>dj")
		vim.keymap.del("n", "<leader>dl")
		vim.keymap.del("n", "<leader>dk")
		vim.keymap.del("n", "<leader>dr")
		vim.keymap.del("n", "<leader>dn")
		dapui.close()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
end

return M
