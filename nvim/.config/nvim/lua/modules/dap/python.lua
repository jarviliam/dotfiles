local ok, dap = pcall(require, "dap")
if not ok then
	vim.api.nvim_err_writeln("err: dap not found")
	return
end
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

dap.configurations.python = {
	{
		name = "KumamushiAPI",
		type = "python",
		request = "attach",
		host = "localhost",
		port = 10001,
		pathMappings = { {
			localRoot = vim.fn.getcwd() .. "/app",
			remoteRoot = "/app/app",
		} },
	},
}
