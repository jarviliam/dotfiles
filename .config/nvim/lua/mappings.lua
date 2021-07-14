local U = require "utils"
local l = '<leader>'

--Core Moves
U.KeyMap('n',l..'h', ':wincmd h<CR>')
U.KeyMap('n',l..'j', ':wincmd j<CR>')
U.KeyMap('n',l..'k', ':wincmd k<CR>')
U.KeyMap('n',l..'l', ':wincmd l<CR>')

-----------------------------------------------------------------------------//
-- NvimTree
-----------------------------------------------------------------------------//
U.KeyMap("n",l..'pv', ':NvimTreeToggle<CR>')
U.KeyMap('n',l..'n', ':NvimTreeFindFile<CR>')
U.KeyMap('n',l..'r', ':NvimTreeRefresh<CR>')

U.KeyMap('n',l..'rp', ':resize 100<CR>')

--Vertical Splitting
U.KeyMap('n',l..'vs', ':vsplit<CR>')
--Resizing
U.KeyMap('n',l..'+', ':vertical resize +5<CR>')
U.KeyMap('n',l..'-', ':vertical resize -5<CR>')


--Undo Tree---
U.KeyMap('n', l..'u', ':UndotreeShow<CR>')

--Fugitive
U.KeyMap('n',l..'gl', ':diffget //3<CR>')
U.KeyMap('n',l..'gh', ':diffget //2<CR>')
U.KeyMap('n',l..'gs', ':G<CR>')

-----------------------------------------------------------------------------//
-- Telescope
-----------------------------------------------------------------------------//
U.KeyMap('n',l..'pw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
U.KeyMap('n',l..'ps', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
U.KeyMap('n',l..'/', ':Telescope live_grep theme=get_ivy<CR>')
U.KeyMap('n',l..'pf', ':Telescope find_files<CR>')
U.KeyMap('n',l..'pr', ':Telescope registers<CR>')
U.KeyMap('n',l..'pc', ':Telescope commands<CR>')
U.KeyMap('n',l..'pC', ':Telescope command_history<CR>')
U.KeyMap('n',l..'pS', ':Telescope search_history<CR>')
U.KeyMap('n',l..'pb', ':Telescope buffers<CR>')
U.KeyMap('n',l..'ph', ':Telescope help_tags<CR>')
U.KeyMap('n','<C-p>', ':Telescope git_files<CR>')

-----------------------------------------------------------------------------//
-- Help
-----------------------------------------------------------------------------//
U.KeyMap("n", "<leader>hm", ":Telescope man_pages<CR>")
U.KeyMap("n", "<leader>ht", ":Telescope colorscheme<CR>")
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

U.KeyMap("n", "<leader>ll", ":lua require'qf'.toggle('l',true)<CR>")
U.KeyMap("n", "<leader>ql", ":lua require'qf'.toggle('c',true)<CR>")
U.KeyMap("n", "<leader>[", ":lua require'qf'.below('visible')<CR>")
U.KeyMap("n", "<leader>]", ":lua require'qf'.above('visible')<CR>")
