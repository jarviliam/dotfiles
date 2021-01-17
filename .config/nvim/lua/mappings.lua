local U = require "utils"

-- TODO: Map Remaps to LUA
--

local l = '<leader>'

--Core Moves
U.KeyMap('n',l..'h', ':wincmd h<CR>')
U.KeyMap('n',l..'j', ':wincmd j<CR>')
U.KeyMap('n',l..'k', ':wincmd k<CR>')
U.KeyMap('n',l..'l', ':wincmd l<CR>')

--NetRc
U.KeyMap('n',l..'pv', ':wincmd v<bar> :Ex <bar> : vertical resize 30<CR>')

--Undo Tree
U.KeyMap('n', l..'u', ':UndotreeShow<CR>')


--Plugin Mappings
-- LSP
U.KeyMap('n',l..'gd', ':lua vim.lsp.buf.definition()<CR>')
U.KeyMap('n',l..'gi', ':lua vim.lsp.buf.implementation()<CR>')
U.KeyMap('n',l..'grf', ':lua vim.lsp.buf.references()<CR>')
U.KeyMap('n',l..'grn', ':lua vim.lsp.buf.rename()<CR>')
U.KeyMap('n',l..'gsd', ':lua vim.lsp.show_line_diagnostics()<CR>')
-- Telescope
--U.KeyMap('n',l..'pw', ':lua require(\"telescope.builtin\").grep_string { search = vim.fin.expand(\"<cword>\") }<CR>')
U.KeyMap('n',l..'pb', ':lua require("telescope.builtin").buffers()<CR>')
U.KeyMap('n',l..'vh', ':lua require("telescope.builtin").help_tags()<CR>')
--U.KeyMap('n',l..'ps', ':lua require(\"telescope.builtin\").grep_string({ search = vim.fin.input(\"Grep for -> \")\})<CR>')
U.KeyMap('n','<C-p>', ':lua require("telescope.builtin").git_files()')
U.KeyMap('n',l..'pf', ':lua require(\"telescope.builtin\").find_files()')
