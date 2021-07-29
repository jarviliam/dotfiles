local U = require("utils")
local l = "<leader>"

-----------------------------------------------------------------------------//
-- Core
-----------------------------------------------------------------------------//
U.KeyMap("n", l .. "h", ":wincmd h<CR>")
U.KeyMap("n", l .. "j", ":wincmd j<CR>")
U.KeyMap("n", l .. "k", ":wincmd k<CR>")
U.KeyMap("n", l .. "l", ":wincmd l<CR>")

-----------------------------------------------------------------------------//
-- NvimTree
-----------------------------------------------------------------------------//
U.KeyMap("n", l .. "pv", ":NvimTreeToggle<CR>")
U.KeyMap("n", l .. "n", ":NvimTreeFindFile<CR>")
U.KeyMap("n", l .. "r", ":NvimTreeRefresh<CR>")

--Resizing
U.KeyMap("n", l .. "+", ":vertical resize +5<CR>")
U.KeyMap("n", l .. "-", ":vertical resize -5<CR>")

--Undo Tree---
U.KeyMap("n", l .. "u", ":UndotreeToggle<CR>")

-----------------------------------------------------------------------------//
-- LSP
-----------------------------------------------------------------------------//

--Mappings
U.KeyMap("n", l .. "gd", ":lua vim.lsp.buf.definition()<CR>")
U.KeyMap("n", l .. "gi", ":lua vim.lsp.buf.implementation()<CR>")
U.KeyMap("n", l .. "gsh", ":lua vim.lsp.buf.signature_help()<CR>")
U.KeyMap("n", l .. "grf", ":lua vim.lsp.buf.references()<CR>")
U.KeyMap("n", l .. "grn", ":lua vim.lsp.buf.rename()<CR>")
U.KeyMap("n", l .. "gf", ":Format<CR>")
U.KeyMap("n", l .. "gsd", ":lua vim.lsp.show_line_diagnostics()<CR>")
U.KeyMap("n", l .. "k", ":lua vim.lsp.buf.hover()<CR>")
U.KeyMap("n", l .. "ca", ":lua vim.lsp.buf.code_action()<CR>")

--LSPSaga
U.KeyMap("n", l .. "pd", ":lua require'lspsaga.provider'.preview_definition()<CR>")
U.KeyMap("n", l .. "cd", ":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
U.KeyMap("n", l .. "e[", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
U.KeyMap("n", l .. "e]", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")

-----------------------------------------------------------------------------//
-- Git
-----------------------------------------------------------------------------//
U.KeyMap("n", l .. "gl", ":diffget //3<CR>")
U.KeyMap("n", l .. "gh", ":diffget //2<CR>")
U.KeyMap("n", l .. "gs", ":G<CR>")
U.KeyMap("n", "<leader>gb", ":Telescope git_branches<CR>") -- git branches
U.KeyMap("n", "<leader>gc", ":Telescope git_commits<CR>") -- git commits
U.KeyMap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>") -- preview hunk
U.KeyMap("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>") -- toggle line blame
U.KeyMap("n", "<leader>gB", ":Gitsigns blame_line<CR>") -- git blame
U.KeyMap("n", "<leader>grh", ":Gitsigns reset_hunk<CR>") -- reset hunk
U.KeyMap("n", "<leader>grb", ":Gitsigns reset_buffer<CR>") -- reset buffer
U.KeyMap("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
U.KeyMap("n", "<leader>gsh", ":Gitsigns stage_hunk<CR>") -- git stage hunk
U.KeyMap("n", "<leader>gsb", ":Gitsigns stage_buffer<CR>") -- git stage buffer
U.KeyMap("n", "<leader>g[", ":Gitsigns prev_hunk<CR>") -- previous hunk
U.KeyMap("n", "<leader>g]", ":Gitsigns next_hunk<CR>") -- next hunk

-----------------------------------------------------------------------------//
-- Telescope
-----------------------------------------------------------------------------//
U.KeyMap("n", l .. "pw", ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
U.KeyMap("n", l .. "ps", ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
U.KeyMap("n", l .. "/", ":Telescope live_grep theme=get_ivy<CR>")
U.KeyMap("n", l .. "pf", ":Telescope find_files<CR>")
U.KeyMap("n", l .. "pr", ":Telescope registers<CR>")
U.KeyMap("n", l .. "pc", ":Telescope commands<CR>")
U.KeyMap("n", l .. "pC", ":Telescope command_history<CR>")
U.KeyMap("n", l .. "pS", ":Telescope search_history<CR>")
U.KeyMap("n", l .. "pb", ":Telescope buffers<CR>")
U.KeyMap("n", l .. "ph", ":Telescope help_tags<CR>")
U.KeyMap("n", l .. "qo", ":Telescope quickfix<CR>")
U.KeyMap("n", l .. "lo", ":Telescope loclist<CR>")

U.KeyMap("n", "<C-p>", ":Telescope git_files<CR>")

-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
U.KeyMap("n", "<leader>hm", ":Telescope man_pages<CR>")
U.KeyMap("n", "<leader>hc", ":Telescope colorscheme<CR>")
U.KeyMap("n", "<leader>ho", ":Telescope vim_options<CR>")
U.KeyMap("n", "<leader>hpi", ":PackerInstall<CR>")
U.KeyMap("n", "<leader>hpu", ":PackerUpdate<CR>")
U.KeyMap("n", "<leader>hps", ":PackerStatus<CR>")
U.KeyMap("n", "<leader>hpS", ":PackerSync<CR>")
U.KeyMap("n", "<leader>hpc", ":PackerCompile<CR>")
U.KeyMap("n", "<leader>hpC", ":PackerClean<CR>")
U.KeyMap("n", "<leader>hph", ":help packer.txt<CR>")

-----------------------------------------------------------------------------//
-- QuickFix
-----------------------------------------------------------------------------//
U.KeyMap("n", "[q", ":cprevious<CR>")
U.KeyMap("n", "]q", ":cnext<CR>")
U.KeyMap("n", "[Q", ":cfirst<CR>")
U.KeyMap("n", "]Q", ":clast<CR>")
U.KeyMap("n", "[l", ":lprevious<CR>")
U.KeyMap("n", "]l", ":lnext<CR>")
U.KeyMap("n", "[L", ":lfirst<CR>")
U.KeyMap("n", "]L", ":llast<CR>")
