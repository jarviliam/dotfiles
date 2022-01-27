local null = require("null-ls")
local fmt = null.builtins.formatting
local U = require("core.utils")

null.setup({
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
		-- # DIAGNOSTICS #
		-- dgn.eslint_d,
		-- dgn.shellcheck,
		-- dgn.luacheck.with({
		--     extra_args = { '--globals', 'vim', '--std', 'luajit' },
		-- }),
	},
	on_attach = function(client, buff)
		U.fmt_on_save(client)
	end,
})
