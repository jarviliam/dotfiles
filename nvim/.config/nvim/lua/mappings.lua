local U = require("utils")
local l = "<leader>"

-----------------------------------------------------------------------------//
-- Core
-----------------------------------------------------------------------------//
U.KeyMap("n", "<C-h>", "<C-w>h")
U.KeyMap("n", "<C-j>", "<C-w>j")
U.KeyMap("n", "<C-k>", "<C-w>k")
U.KeyMap("n", "<C-l>", "<C-w>l")

U.KeyMap("n", l .. "wh", "<C-w>h")
U.KeyMap("n", l .. "wj", "<C-w>j")
U.KeyMap("n", l .. "wk", "<C-w>k")
U.KeyMap("n", l .. "wl", "<C-w>l")

-- Move Selection
U.KeyMap("v", "J", ":m '>+1<CR>gv=gv")
U.KeyMap("v", "K", ":m '<-2<CR>gv=gv")

-- Yank End
U.KeyMap("n", "Y", "y$")

U.KeyMap("n", "n", "nzzzv")
U.KeyMap("n", "N", "Nzzzv")
U.KeyMap("n", "J", "mzJ`z")

U.KeyMap("n", l .. "wq", "<C-w>q") -- quit window
U.KeyMap("n", l .. "ws", "<C-w>s") -- split window
U.KeyMap("n", l .. "wv", "<C-w>v") -- vertical split
U.KeyMap("n", l .. "wr", "<C-w>x") -- replace current with next
--
--Resizing
U.KeyMap("n", l .. "w,", ":vertical resize -10<CR>") -- decrease width
U.KeyMap("n", l .. "w.", ":vertical resize +10<CR>") -- increase width
U.KeyMap("n", l .. "w-", ":resize -15<CR>") -- decrease height
U.KeyMap("n", l .. "w=", ":resize +15<CR>") -- increase height

-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
U.KeyMap("n", "<TAB>", ":bnext<CR>") -- buffer next
U.KeyMap("n", "<S-TAB>", ":bprevious<CR>") -- buffer previous

-----------------------------------------------------------------------------//
-- NvimTree
-----------------------------------------------------------------------------//
U.KeyMap("n", l .. "pv", ":NvimTreeToggle<CR>")
U.KeyMap("n", l .. "n", ":NvimTreeFindFile<CR>")
U.KeyMap("n", l .. "r", ":NvimTreeRefresh<CR>")

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
U.KeyMap("n", l .. "qf", ":Telescope quickfix<CR>")
U.KeyMap("n", l .. "ql", ":Telescope loclist<CR>")

U.KeyMap("n", "<C-p>", ":Telescope git_files<CR>")

-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
U.KeyMap("n", "<leader>hm", ":Telescope man_pages<CR>")
U.KeyMap("n", "<leader>km", ":Telescope keymaps<CR>")
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
