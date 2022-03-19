vim.g.mapleader = " "
local l = "<leader>"
local map = vim.keymap.set

-----------------------------------------------------------------------------//
-- Core
-----------------------------------------------------------------------------//
map("n", l .. "th", "<C-w>h", { silent = true, desc = "move: left" })
map("n", l .. "tj", "<C-w>j", { silent = true, desc = "move: down" })
map("n", l .. "tk", "<C-w>k", { silent = true, desc = "move: up" })
map("n", l .. "tl", "<C-w>l", { silent = true, desc = "move: right" })

-- Move Selection
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "shift: up" })
map("v", "K", ":m '>-1<CR>gv=gv", { silent = true, desc = "shift: down" })

map("v", ">>", ">><Esc>gv", { desc = "indent and reselect" }) -- reselect after >>
map("v", "<<", "<<<Esc>gv", { desc = "dedent and reselect" }) -- reselect after <<

map("n", "Q", "<Nop>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-----------------------------------------------------------------------------//
-- buffers {{{1
-----------------------------------------------------------------------------//
map(
	"n",
	"<TAB>",
	":bnext<CR>",
	{ silent = true, desc = "buffer: cycle forward" }
)
map(
	"n",
	"<S-TAB>",
	":bprevious<CR>",
	{ silent = true, desc = "buffer: cycle backward" }
)

--Undo Tree---
map(
	"n",
	l .. "u",
	":UndotreeToggle<CR>",
	{ silent = true, desc = "undo: toggle" }
)

map(
	"n",
	l .. "q",
	":lua require('core.utils').clear_buffers()<CR>",
	{ silent = true, desc = "buffer: clear" }
)
