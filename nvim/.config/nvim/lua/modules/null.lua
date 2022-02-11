local ok, null_ls = as.safe_require("null-ls")
if not ok then
	return
end
local fmt = null_ls.builtins.formatting
local U = require("core.utils")

null_ls.setup({
	sources = {
		fmt.trim_whitespace.with({
			filetypes = { "text", "sh", "zsh", "toml", "make", "conf", "tmux" },
		}),
		fmt.prettierd,
		fmt.eslint_d,
		fmt.rustfmt,
		fmt.stylua,
		fmt.terraform_fmt,
		fmt.gofmt,
		fmt.goimports,
		fmt.cmake_format,
		fmt.clang_format,
		fmt.black,
		fmt.isort,
	},
	on_attach = function(client, _)
		U.fmt_on_save(client)
	end,
})
