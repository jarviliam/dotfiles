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

-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
nmap("<TAB>", ":bnext<CR>") -- buffer next
nmap("<S-TAB>", ":bprevious<CR>") -- buffer previous

-----------------------------------------------------------------------------//
-- NvimTree
-----------------------------------------------------------------------------//
--nmap(l .. "tt", ":NvimTreeToggle<CR>")

--Undo Tree---
nmap(l .. "u", ":UndotreeToggle<CR>")

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
