local ok, dap = as.safe_require("dap")
if not ok then
	return
end
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

table.insert(dap.configurations.python, {
	name = "KumamushiAPI",
	type = "python",
	request = "attach",
	host = "localhost",
	port = 10001,
	justMyCode = false,
	pathMappings = {
		{
			localRoot = "/Users/liam.jarvis/.pyenv/versions/3.10.1/lib/python3.10",
			remoteRoot = "/opt/pysetup/.venv/lib/python3.9",
		},
		{
			localRoot = vim.fn.getcwd(),
			remoteRoot = "/",
		},
	},
})
