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

map("v", ">", ">gv", { desc = "indent and reselect" }) -- reselect after >>
map("v", "<", "<gv", { desc = "dedent and reselect" }) -- reselect after <<

map("n", "Q", "<Nop>")

map({ "n", "v", "i" }, "<C-F>", "<Esc>gUiw`]a")

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

map("n", "fn", "<cmd>enew<cr>", { silent = true, desc = "New file" })

map("n", "hpp", "<cmd>PackerSync<cr>", { silent = true, desc = "Packer Sync" })
map(
  "n",
  "hps",
  "<cmd>PackerStatus<cr>",
  { silent = true, desc = "Packer Status" }
)
map(
  "n",
  "hpi",
  "<cmd>PackerInstall<cr>",
  { silent = true, desc = "Packer Install" }
)
map(
  "n",
  "hpc",
  "<cmd>PackerCompile<cr>",
  { silent = true, desc = "Packer Compile" }
)
