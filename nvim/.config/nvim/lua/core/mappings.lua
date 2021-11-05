vim.g.mapleader = " "
local l = "<leader>"
-----------------------------------------------------------------------------//
-- Core
-----------------------------------------------------------------------------//
as.KeyMap("n", "<C-h>", "<C-w>h")
as.KeyMap("n", "<C-j>", "<C-w>j")
as.KeyMap("n", "<C-k>", "<C-w>k")
as.KeyMap("n", "<C-l>", "<C-w>l")

-- <ctrl-s> to Save
as.KeyMap("n", "<C-S>", "<esc>:update<cr>", { silent = true })
as.KeyMap("v", "<C-S>", "<esc>:update<cr>", { silent = true })
as.KeyMap("i", "<C-S>", "<esc>:update<cr>", { silent = true })

as.KeyMap("n", l .. "th", "<C-w>h")
as.KeyMap("n", l .. "tj", "<C-w>j")
as.KeyMap("n", l .. "tk", "<C-w>k")
as.KeyMap("n", l .. "tl", "<C-w>l")

-- Move Selection
as.KeyMap("v", "J", ":m '>+1<CR>gv=gv")
as.KeyMap("v", "K", ":m '<-2<CR>gv=gv")

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
as.KeyMap("n", l .. "tt", ":NvimTreeToggle<CR>")
as.KeyMap("n", l .. "r", ":NvimTreeRefresh<CR>")

--as.do Tree---
as.KeyMap("n", l .. "u", ":UndotreeToggle<CR>")

-----------------------------------------------------------------------------//
-- LSP
-----------------------------------------------------------------------------//

--Mappings
as.KeyMap("n", l .. "ff", ":Format<CR>")
as.KeyMap("n", l .. "nd", ":lua vim.lsp.buf.definition()<CR>")
as.KeyMap("n", l .. "ni", ":lua vim.lsp.buf.implementation()<CR>")
as.KeyMap("n", l .. "grf", ":lua vim.lsp.buf.references()<CR>")

--LSPSaga
as.KeyMap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
as.KeyMap("n", l .. "K", "<cmd>lua require('lspsaga.signature_help').signature_help()<CR>")
as.KeyMap("n", "ga", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
as.KeyMap("v", "ga", "<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
as.KeyMap("n", l .. "np", ":lua require'lspsaga.provider'.preview_definition()<CR>")
as.KeyMap("n", l .. "nv", ":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
as.KeyMap("n", l .. "e[", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
as.KeyMap("n", l .. "e]", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")
as.KeyMap("n", l .. "nr", "<cmd>lua require('lspsaga.rename').rename()<CR>")

-----------------------------------------------------------------------------//
-- Git
-----------------------------------------------------------------------------//
as.KeyMap("n", l .. "gj", ":diffget //3<CR>")
as.KeyMap("n", l .. "gb", ":diffget //2<CR>")
as.KeyMap("n", l .. "gs", ":G<CR>")
as.KeyMap("n", l .. "gl", ":Telescope git_branches<CR>") -- git branches
as.KeyMap("n", l .. "gy", ":Telescope git_commits<CR>") -- git commits
as.KeyMap("n", l .. "gm", ":Gitsigns preview_hunk<CR>") -- preview hunk
as.KeyMap("n", l .. "bl", ":Gitsigns blame_line<CR>") -- git blame
as.KeyMap("n", l .. "grh", ":Gitsigns reset_hunk<CR>") -- reset hunk
as.KeyMap("n", l .. "grb", ":Gitsigns reset_buffer<CR>") -- reset buffer
as.KeyMap("n", l .. "gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
as.KeyMap("n", l .. "gsh", ":Gitsigns stage_hunk<CR>") -- git stage hunk
as.KeyMap("n", l .. "gsb", ":Gitsigns stage_buffer<CR>") -- git stage buffer
as.KeyMap("n", l .. "g.", ":Gitsigns prev_hunk<CR>") -- previous hunk
as.KeyMap("n", l .. "g,", ":Gitsigns next_hunk<CR>") -- next hunk

-----------------------------------------------------------------------------//
-- Telescope
-----------------------------------------------------------------------------//
as.KeyMap("n", l .. "nw", ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
as.KeyMap("n", l .. "ns", ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
as.KeyMap("n", l .. "/", ":Telescope live_grep theme=get_ivy<CR>")
as.KeyMap("n", l .. "nf", ":Telescope find_files<CR>")
as.KeyMap("n", l .. "nR", ":Telescope registers<CR>")
as.KeyMap("n", l .. "nc", ":Telescope commands<CR>")
as.KeyMap("n", l .. "nC", ":Telescope command_history<CR>")
as.KeyMap("n", l .. "nS", ":Telescope search_history<CR>")
as.KeyMap("n", l .. "<TAB>", ":Telescope buffers<CR>")
as.KeyMap("n", l .. "?", ":Telescope help_tags<CR>")
as.KeyMap("n", l .. "nO", ":Telescope lsp_workspace_diagnostics<CR>")
as.KeyMap("n", l .. "no", ":Telescope lsp_document_diagnostics<CR>")
as.KeyMap("n", l .. "zj", ":Telescope quickfix<CR>")
as.KeyMap("n", l .. "zj", ":Telescope quickfix<CR>")
as.KeyMap("n", l .. "zl", ":Telescope loclist<CR>")
as.KeyMap("n", "<C-p>", ":Telescope git_files<CR>")

-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
as.KeyMap("n", "<leader>hm", ":Telescope man_pages<CR>")
as.KeyMap("n", "<leader>hd", ":Telescope keymaps<CR>")
as.KeyMap("n", "<leader>hc", ":Telescope colorscheme<CR>")
as.KeyMap("n", "<leader>ho", ":Telescope vim_options<CR>")

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
