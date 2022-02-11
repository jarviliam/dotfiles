vim.g.mapleader = " "
local l = "<leader>"
local nmap = require("keymap").nmap
local vmap = require("keymap").vmap

-----------------------------------------------------------------------------//
-- Core
-----------------------------------------------------------------------------//
nmap(l .. "th", "<C-w>h")
nmap(l .. "tj", "<C-w>j")
nmap(l .. "tk", "<C-w>k")
nmap(l .. "tl", "<C-w>l")

-- Move Selection
vmap("J", ":m '>+1<CR>gv=gv")

nmap("Q", "<Nop>")

nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")

nmap(l .. "ws", "<C-w>s") -- split window
nmap(l .. "wv", "<C-w>v") -- vertical split

-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
nmap("<TAB>", ":bnext<CR>") -- buffer next
nmap("<S-TAB>", ":bprevious<CR>") -- buffer previous

-----------------------------------------------------------------------------//
-- NvimTree
-----------------------------------------------------------------------------//
nmap(l .. "tt", "<cmd>NvimTreeToggle<CR>")

--Undo Tree---
nmap(l .. "u", ":UndotreeToggle<CR>")

-----------------------------------------------------------------------------//
-- Git
-----------------------------------------------------------------------------//
nmap(l .. "gs", "<cmd>lua require 'neogit'.open()<CR>")
nmap(l .. "hp", ":Gitsigns preview_hunk<CR>") -- preview hunk
nmap(l .. "hb", ":Gitsigns blame_line<CR>") -- git blame
nmap(l .. "hr", ":Gitsigns reset_hunk<CR>") -- reset hunk
nmap(l .. "hR", ":Gitsigns reset_buffer<CR>") -- reset buffer
nmap(l .. "hu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
nmap(l .. "hs", ":Gitsigns stage_hunk<CR>") -- git stage hunk
nmap(l .. "hS", ":Gitsigns stage_buffer<CR>") -- git stage buffer
nmap(l .. "g.", ":Gitsigns prev_hunk<CR>") -- previous hunk
nmap(l .. "g,", ":Gitsigns next_hunk<CR>") -- next hunk

-----------------------------------------------------------------------------//
-- Telescope
-----------------------------------------------------------------------------//
nmap(l .. "/", ":Telescope live_grep theme=get_ivy<CR>")
nmap(l .. "nf", ":Telescope fd<CR>")
nmap(l .. "<TAB>", ":Telescope buffers<CR>")
nmap(l .. "?", ":Telescope help_tags<CR>")
nmap(l .. "nO", ":Telescope diagnostics<CR>")
nmap(l .. "no", ":Telescope diagnostics bufnr=0<CR>")
nmap(l .. "nz", ":Telescope quickfix<CR>")
nmap(l .. "nx", ":Telescope loclist<CR>")

nmap(l .. "d,", ":Telescope dap frames<CR>")
nmap(l .. "dh", ":lua require 'dap.ui.widgets'.hover()<CR>")
vmap(l .. "dh", ":lua require 'dap.ui.widgets'.visual_hover()<CR>")
nmap(l .. "df", ":lua require 'dapui'.toggle()<CR>")
nmap(l .. "d.", ":Telescope dap list_breakpoints<CR>")
nmap(l .. "d-", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nmap(l .. "dj", ":lua require'dap'.step_into()<CR>")
nmap(l .. "dl", ":lua require'dap'.step_over()<CR>")
nmap(l .. "dk", ":lua require'dap'.step_out()<CR>")
nmap(l .. "dr", ":lua require'dap'.restart()<CR>")
nmap(l .. "dq", ":lua require'dap'.terminate()<CR>")
nmap(l .. "dn", ":lua require'dap'.run_to_cursor()<CR>")
nmap(l .. "d~", ":lua require'dap'.toggle_breakpoint()<CR>")
nmap(l .. "do", ":lua require'dap'.continue()<CR>")

--
-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
nmap("<leader>hd", ":Telescope keymaps<CR>")
nmap("<leader>hc", ":Telescope colorscheme<CR>")
nmap("<leader>ho", ":Telescope vim_options<CR>")

-----------------------------------------------------------------------------//
-- QuickFix
----------------------------------------------------------------------------//
nmap("[q", ":cprevious<CR>")
nmap("]q", ":cnext<CR>")
nmap("[Q", ":cfirst<CR>")
nmap("]Q", ":clast<CR>")
nmap("[l", ":lprevious<CR>")
nmap("]l", ":lnext<CR>")
nmap("[L", ":lfirst<CR>")
nmap("]L", ":llast<CR>")

nmap(l .. "q", ":lua require('core.utils').clear_buffers()<CR>")
