local ok, null_ls = as.safe_require("null-ls")
if not ok then
	return
end
local fmt = null_ls.builtins.formatting
local U = require("core.utils")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		fmt.trim_whitespace.with({
			filetypes = { "text", "sh", "zsh", "toml", "make", "conf", "tmux" },
		}),
		fmt.prettierd,
		fmt.eslint_d,
		fmt.rustfmt,
		fmt.stylua.with({
			extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") },
		}),
		fmt.terraform_fmt,
		fmt.gofmt,
		fmt.goimports,
		fmt.cmake_format,
		fmt.clang_format,
		fmt.black,
		fmt.isort,
		fmt.shfmt,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.hover.dictionary,
		null_ls.builtins.diagnostics.actionlint.with({
			condition = function()
				local name = vim.api.nvim_buf_get_name(0)
				return string.find(name, ".github")
			end,
		}),
		null_ls.builtins.diagnostics.luacheck.with({
			extra_args = {
				"--config-path",
				vim.fn.expand("~/.config/nvim/.luacheckrc"),
			},
		}),
		null_ls.builtins.diagnostics.misspell,
	},
	on_attach = function(client, _)
		U.fmt_on_save(client)
	end,
})
