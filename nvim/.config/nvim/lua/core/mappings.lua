vim.g.mapleader = " "
local l = "<leader>"
local function remap(mode, lhs, rhs)
   vim.api.nvim_set_keymap(mode,lhs,rhs, {silent= true, noremap = true})
end

-----------------------------------------------------------------------------//
-- Core
-----------------------------------------------------------------------------//
remap("n", "<C-h>", "<C-w>h")
remap("n", "<C-j>", "<C-w>j")
remap("n", "<C-k>", "<C-w>k")
remap("n", "<C-l>", "<C-w>l")

-- <ctrl-s> to Save
remap("n", "<C-S>", "<esc>:update<cr>")
remap("v", "<C-S>", "<esc>:update<cr>")
remap("i", "<C-S>", "<esc>:update<cr>")

remap("n", l .. "th", "<C-w>h")
remap("n", l .. "tj", "<C-w>j")
remap("n", l .. "tk", "<C-w>k")
remap("n", l .. "tl", "<C-w>l")

-- Move Selection
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")

remap("n", "Q", "<Nop>")

remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")
remap("n", "J", "mzJ`z")

remap("n", l .. "wq", "<C-w>q") -- quit window
remap("n", l .. "ws", "<C-w>s") -- split window
remap("n", l .. "wv", "<C-w>v") -- vertical split
remap("n", l .. "wr", "<C-w>x") -- replace current with next
--
--Resizing
remap("n", l .. "w,", ":vertical resize -10<CR>") -- decrease width
remap("n", l .. "w.", ":vertical resize +10<CR>") -- increase width
remap("n", l .. "w-", ":resize -15<CR>") -- decrease height
remap("n", l .. "w=", ":resize +15<CR>") -- increase height

-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
remap("n", "<TAB>", ":bnext<CR>") -- buffer next
remap("n", "<S-TAB>", ":bprevious<CR>") -- buffer previous

-----------------------------------------------------------------------------//
-- NvimTree
-----------------------------------------------------------------------------//
remap("n", l .. "tt", ":NvimTreeToggle<CR>")
remap("n", l .. "r", ":NvimTreeRefresh<CR>")

--as.do Tree---
remap("n", l .. "u", ":UndotreeToggle<CR>")

-----------------------------------------------------------------------------//
-- LSP
-----------------------------------------------------------------------------//

--Mappings
remap("n", l .. "ff", ":Format<CR>")
remap("n", l .. "nd", ":lua vim.lsp.buf.definition()<CR>")
remap("n", l .. "ni", ":lua vim.lsp.buf.implementation()<CR>")
remap("n", l .. "gf", ":lua vim.lsp.buf.references()<CR>")

--LSPSaga
remap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
remap("n", l .. "K", "<cmd>lua require('lspsaga.signature_help').signature_help()<CR>")
remap("n", "ga", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
remap("v", "ga", "<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
remap("n", l .. "np", ":lua require'lspsaga.provider'.preview_definition()<CR>")
remap("n", l .. "nv", ":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
remap("n", l .. "e[", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
remap("n", l .. "e]", ":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")
remap("n", l .. "nr", "<cmd>lua require('lspsaga.rename').rename()<CR>")

-----------------------------------------------------------------------------//
-- Git
-----------------------------------------------------------------------------//
remap("n", l .. "gj", ":diffget //3<CR>")
remap("n", l .. "gb", ":diffget //2<CR>")
remap("n", l .. "gs", ":G<CR>")
remap("n", l .. "gl", ":Telescope git_branches<CR>") -- git branches
remap("n", l .. "gy", ":Telescope git_commits<CR>") -- git commits
remap("n", l .. "gm", ":Gitsigns preview_hunk<CR>") -- preview hunk
remap("n", l .. "bl", ":Gitsigns blame_line<CR>") -- git blame
remap("n", l .. "grh", ":Gitsigns reset_hunk<CR>") -- reset hunk
remap("n", l .. "grb", ":Gitsigns reset_buffer<CR>") -- reset buffer
remap("n", l .. "gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
remap("n", l .. "gsh", ":Gitsigns stage_hunk<CR>") -- git stage hunk
remap("n", l .. "gsb", ":Gitsigns stage_buffer<CR>") -- git stage buffer
remap("n", l .. "g.", ":Gitsigns prev_hunk<CR>") -- previous hunk
remap("n", l .. "g,", ":Gitsigns next_hunk<CR>") -- next hunk

-----------------------------------------------------------------------------//
-- Telescope
-----------------------------------------------------------------------------//
remap("n", l .. "nw", ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
remap("n", l .. "ns", ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
remap("n", l .. "/", ":Telescope live_grep theme=get_ivy<CR>")
remap("n", l .. "nf", ":Telescope find_files<CR>")
remap("n", l .. "nR", ":Telescope registers<CR>")
remap("n", l .. "nc", ":Telescope commands<CR>")
remap("n", l .. "nC", ":Telescope command_history<CR>")
remap("n", l .. "nS", ":Telescope search_history<CR>")
remap("n", l .. "<TAB>", ":Telescope buffers<CR>")
remap("n", l .. "?", ":Telescope help_tags<CR>")
remap("n", l .. "nO", ":Telescope lsp_workspace_diagnostics<CR>")
remap("n", l .. "no", ":Telescope lsp_document_diagnostics<CR>")
remap("n", l .. "zj", ":Telescope quickfix<CR>")
remap("n", l .. "zl", ":Telescope loclist<CR>")
remap("n", "<C-p>", ":Telescope git_files<CR>")

-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
remap("n", "<leader>hm", ":Telescope man_pages<CR>")
remap("n", "<leader>hd", ":Telescope keymaps<CR>")
remap("n", "<leader>hc", ":Telescope colorscheme<CR>")
remap("n", "<leader>ho", ":Telescope vim_options<CR>")

-----------------------------------------------------------------------------//
-- QuickFix
----------------------------------------------------------------------------//
remap("n", "[q", ":cprevious<CR>")
remap("n", "]q", ":cnext<CR>")
remap("n", "[Q", ":cfirst<CR>")
remap("n", "]Q", ":clast<CR>")
remap("n", "[l", ":lprevious<CR>")
remap("n", "]l", ":lnext<CR>")
remap("n", "[L", ":lfirst<CR>")
remap("n", "]L", ":llast<CR>")
