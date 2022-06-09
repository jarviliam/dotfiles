local ok, null_ls = as.safe_require("null-ls")
if not ok then
  return
end
local fmt = null_ls.builtins.formatting
local dgn = null_ls.builtins.diagnostics
local U = require("core.utils")

null_ls.setup({
  sources = {
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
    dgn.hadolint,
    dgn.yamllint,
    null_ls.builtins.hover.dictionary,
    dgn.actionlint.with({
      condition = function()
        local name = vim.api.nvim_buf_get_name(0)
        return string.find(name, ".github")
      end,
    }),
    dgn.luacheck.with({
      extra_args = {
        "--config-path",
        vim.fn.expand("~/.config/nvim/.luacheckrc"),
      },
    }),
    dgn.misspell,
  },
  on_attach = function(client, bufnr)
    U.fmt_on_save(client, bufnr)
  end,
})
