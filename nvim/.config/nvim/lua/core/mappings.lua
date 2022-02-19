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
nmap(l .. "tt", ":NvimTreeToggle<CR>")

--Undo Tree---
nmap(l .. "u", ":UndotreeToggle<CR>")

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

nmap(l .. "d.", ":Telescope dap list_breakpoints<CR>")

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
