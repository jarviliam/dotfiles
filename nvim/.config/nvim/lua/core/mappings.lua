vim.g.mapleader = " "
local l = "<leader>"
-----------------------------------------------------------------------------//
-- Core
-----------------------------------------------------------------------------//
as.KeyMap("n", "<C-h>", "<C-w>h")
as.KeyMap("n", "<C-j>", "<C-w>j")
as.KeyMap("n", "<C-k>", "<C-w>k")
as.KeyMap("n", "<C-l>", "<C-w>l")

as.KeyMap("n", l .. "wh", "<C-w>h")
as.KeyMap("n", l .. "wj", "<C-w>j")
as.KeyMap("n", l .. "wk", "<C-w>k")
as.KeyMap("n", l .. "wl", "<C-w>l")

-- Move Selection
as.KeyMap("v", "J", ":m '>+1<CR>gv=gv")
as.KeyMap("v", "K", ":m '<-2<CR>gv=gv")

-- Yank End
as.KeyMap("n", "Y", "y$")

as.KeyMap("n", "Q", "<Nop>")

as.KeyMap("n", "n", "nzzzv")
as.KeyMap("n", "N", "Nzzzv")
as.KeyMap("n", "J", "mzJ`z")

as.KeyMap("n", l .. "wq", "<C-w>q") -- quit window
as.KeyMap("n", l .. "ws", "<C-w>s") -- split window
as.KeyMap("n", l .. "wv", "<C-w>v") -- vertical split
as.KeyMap("n", l .. "wr", "<C-w>x") -- replace current with next
--
--Resizing
as.KeyMap("n", l .. "w,", ":vertical resize -10<CR>") -- decrease width
as.KeyMap("n", l .. "w.", ":vertical resize +10<CR>") -- increase width
as.KeyMap("n", l .. "w-", ":resize -15<CR>") -- decrease height
as.KeyMap("n", l .. "w=", ":resize +15<CR>") -- increase height

-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
as.KeyMap("n", "<TAB>", ":bnext<CR>") -- buffer next
as.KeyMap("n", "<S-TAB>", ":bprevious<CR>") -- buffer previous

-----------------------------------------------------------------------------//
-- NvimTree
-----------------------------------------------------------------------------//
as.KeyMap("n", l .. "pv", ":NvimTreeToggle<CR>")
as.KeyMap("n", l .. "n", ":NvimTreeFindFile<CR>")
as.KeyMap("n", l .. "r", ":NvimTreeRefresh<CR>")

--as.do Tree---
as.KeyMap("n", l .. "u", ":UndotreeToggle<CR>")

-----------------------------------------------------------------------------//
-- LSP
-----------------------------------------------------------------------------//

--Mappings
as.KeyMap("n", l .. "gd", ":lua vim.lsp.buf.definition()<CR>")
as.KeyMap("n", l .. "gi", ":lua vim.lsp.buf.implementation()<CR>")
as.KeyMap("n", l .. "gsh", ":lua vim.lsp.buf.signature_help()<CR>")
as.KeyMap("n", l .. "grf", ":lua vim.lsp.buf.references()<CR>")
as.KeyMap("n", l .. "grn", ":lua vim.lsp.buf.rename()<CR>")
as.KeyMap("n", l .. "gf", ":Format<CR>")
as.KeyMap("n", l .. "gsd", ":lua vim.lsp.show_line_diagnostics()<CR>")
as.KeyMap("n", l .. "k", ":lua vim.lsp.buf.hover()<CR>")
as.KeyMap("n", l .. "ca", ":lua vim.lsp.buf.code_action()<CR>")

--LSPSaga
as.KeyMap("n", l .. "pd", ":lua require'lspsaga.provider'.preview_definition()<CR>")
as.KeyMap("n", l .. "cd", ":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
as.KeyMap("n", l .. "e[", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
as.KeyMap("n", l .. "e]", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")

-----------------------------------------------------------------------------//
-- Git
-----------------------------------------------------------------------------//
as.KeyMap("n", l .. "gl", ":diffget //3<CR>")
as.KeyMap("n", l .. "gh", ":diffget //2<CR>")
as.KeyMap("n", l .. "gs", ":G<CR>")
as.KeyMap("n", "<leader>gb", ":Telescope git_branches<CR>") -- git branches
as.KeyMap("n", "<leader>gc", ":Telescope git_commits<CR>") -- git commits
as.KeyMap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>") -- preview hunk
as.KeyMap("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>") -- toggle line blame
as.KeyMap("n", "<leader>gB", ":Gitsigns blame_line<CR>") -- git blame
as.KeyMap("n", "<leader>grh", ":Gitsigns reset_hunk<CR>") -- reset hunk
as.KeyMap("n", "<leader>grb", ":Gitsigns reset_buffer<CR>") -- reset buffer
as.KeyMap("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
as.KeyMap("n", "<leader>gsh", ":Gitsigns stage_hunk<CR>") -- git stage hunk
as.KeyMap("n", "<leader>gsb", ":Gitsigns stage_buffer<CR>") -- git stage buffer
as.KeyMap("n", "<leader>g[", ":Gitsigns prev_hunk<CR>") -- previous hunk
as.KeyMap("n", "<leader>g]", ":Gitsigns next_hunk<CR>") -- next hunk

-----------------------------------------------------------------------------//
-- Telescope
-----------------------------------------------------------------------------//
as.KeyMap("n", l .. "pw", ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
as.KeyMap("n", l .. "ps", ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
as.KeyMap("n", l .. "/", ":Telescope live_grep theme=get_ivy<CR>")
as.KeyMap("n", l .. "pf", ":Telescope find_files<CR>")
as.KeyMap("n", l .. "pr", ":Telescope registers<CR>")
as.KeyMap("n", l .. "pc", ":Telescope commands<CR>")
as.KeyMap("n", l .. "pC", ":Telescope command_history<CR>")
as.KeyMap("n", l .. "pS", ":Telescope search_history<CR>")
as.KeyMap("n", l .. "pb", ":Telescope buffers<CR>")
as.KeyMap("n", l .. "ph", ":Telescope help_tags<CR>")
as.KeyMap("n", l .. "qf", ":Telescope quickfix<CR>")
as.KeyMap("n", l .. "ql", ":Telescope loclist<CR>")

as.KeyMap("n", "<C-p>", ":Telescope git_files<CR>")

-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
as.KeyMap("n", "<leader>hm", ":Telescope man_pages<CR>")
as.KeyMap("n", "<leader>km", ":Telescope keymaps<CR>")
as.KeyMap("n", "<leader>hc", ":Telescope colorscheme<CR>")
as.KeyMap("n", "<leader>ho", ":Telescope vim_options<CR>")
as.KeyMap("n", "<leader>hpi", ":PackerInstall<CR>")
as.KeyMap("n", "<leader>hpu", ":PackerUpdate<CR>")
as.KeyMap("n", "<leader>hps", ":PackerStatus<CR>")
as.KeyMap("n", "<leader>hpS", ":PackerSync<CR>")
as.KeyMap("n", "<leader>hpc", ":PackerCompile<CR>")
as.KeyMap("n", "<leader>hpC", ":PackerClean<CR>")
as.KeyMap("n", "<leader>hph", ":help packer.txt<CR>")

-----------------------------------------------------------------------------//
-- QuickFix
-----------------------------------------------------------------------------//
as.KeyMap("n", "[q", ":cprevious<CR>")
as.KeyMap("n", "]q", ":cnext<CR>")
as.KeyMap("n", "[Q", ":cfirst<CR>")
as.KeyMap("n", "]Q", ":clast<CR>")
as.KeyMap("n", "[l", ":lprevious<CR>")
as.KeyMap("n", "]l", ":lnext<CR>")
as.KeyMap("n", "[L", ":lfirst<CR>")
as.KeyMap("n", "]L", ":llast<CR>")
