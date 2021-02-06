--Declare Options for easier access
local option = vim.opt

option.completeopt = {"menuone", "noinsert", "noselect"}

vim.cmd [[set shortmess+=c]]

--Completion.NVIM
vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_enable_snippet = 'snippets.nvim'

vim.g.completion_trigger_keyword_length = 2

--Diagnostics
vim.g.diagnostic_enable_virtual_text = 1
