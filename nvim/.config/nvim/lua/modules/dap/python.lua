local ok, dap = as.safe_require("dap")
if not ok then
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
