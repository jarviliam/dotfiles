local U = require "utils"
local l = '<leader>'

--Core Moves
U.KeyMap('n',l..'h', ':wincmd h<CR>')
U.KeyMap('n',l..'j', ':wincmd j<CR>')
U.KeyMap('n',l..'k', ':wincmd k<CR>')
U.KeyMap('n',l..'l', ':wincmd l<CR>')

--NvimTree--
U.KeyMap("n",l..'pv', ':NvimTreeToggle<CR>')
U.KeyMap('n',l..'rp', ':resize 100<CR>')

--Resource
--U.KeyMap('n',l..'<CR>', ':so ~/.config/nvim/init.vim<CR>')

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

--
