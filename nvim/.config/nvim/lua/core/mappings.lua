vim.g.mapleader = " "
local l = "<leader>"
local function remap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true, noremap = true })
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
remap("n", l .. "nr", "<cmd>lua require('lspsaga.rename').rename()<CR>")

-----------------------------------------------------------------------------//
-- Git
-----------------------------------------------------------------------------//
remap("n", l .. "gj", ":diffget //3<CR>")
remap("n", l .. "gb", ":diffget //2<CR>")
remap("n", l .. "gs", ":G<CR>")
remap("n", l .. "gl", ":Telescope git_branches<CR>") -- git branches
remap("n", l .. "gy", ":Telescope git_commits<CR>") -- git commits
remap("n", l .. "hp", ":Gitsigns preview_hunk<CR>") -- preview hunk
remap("n", l .. "hb", ":Gitsigns blame_line<CR>") -- git blame
remap("n", l .. "hr", ":Gitsigns reset_hunk<CR>") -- reset hunk
remap("n", l .. "hR", ":Gitsigns reset_buffer<CR>") -- reset buffer
remap("n", l .. "hu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
remap("n", l .. "hs", ":Gitsigns stage_hunk<CR>") -- git stage hunk
remap("n", l .. "hS", ":Gitsigns stage_buffer<CR>") -- git stage buffer
remap("n", l .. "g.", ":Gitsigns prev_hunk<CR>") -- previous hunk
remap("n", l .. "g,", ":Gitsigns next_hunk<CR>") -- next hunk

-----------------------------------------------------------------------------//
-- Telescope
-----------------------------------------------------------------------------//
remap("n", l .. "/", ":Telescope live_grep theme=get_ivy<CR>")
remap("n", l .. "nf", ":Telescope find_files<CR>")
remap("n", l .. "nR", ":Telescope registers<CR>")
remap("n", l .. "nC", ":Telescope commands<CR>")
remap("n", l .. "nS", ":Telescope search_history<CR>")
remap("n", l .. "<TAB>", ":Telescope buffers<CR>")
remap("n", l .. "?", ":Telescope help_tags<CR>")
remap("n", l .. "nO", ":Telescope diagnostics<CR>")
remap("n", l .. "no", ":Telescope diagnostics bufnr=0<CR>")
remap("n", l .. "nz", ":Telescope quickfix<CR>")
remap("n", l .. "nx", ":Telescope loclist<CR>")

remap("n", l .. "d,", ":Telescope dap frames<CR>")
remap("n", l .. "dh", ":lua require 'dap.ui.widgets'.hover()<CR>")
remap("v", l .. "dh", ":lua require 'dap.ui.widgets'.visual_hover()<CR>")
remap("n", l .. "df", ":lua require 'dapui'.toggle()<CR>")
remap("n", l .. "d.", ":Telescope dap list_breakpoints<CR>")
remap("n", l .. "d-", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
remap("n", l .. "dj", ":lua require'dap'.step_into()<CR>")
remap("n", l .. "dl", ":lua require'dap'.step_over()<CR>")
remap("n", l .. "dk", ":lua require'dap'.step_out()<CR>")
remap("n", l .. "dr", ":lua require'dap'.restart()<CR>")
remap("n", l .. "dq", ":lua require'dap'.terminate()<CR>")
remap("n", l .. "dn", ":lua require'dap'.run_to_cursor()<CR>")
remap("n", l .. "d~", ":lua require'dap'.toggle_breakpoint()<CR>")
remap("n", l .. "do", ":lua require'dap'.continue()<CR>")

--
-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
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

remap("n", l .. "q", ":lua require('core.buffers').Clear()<CR>")
