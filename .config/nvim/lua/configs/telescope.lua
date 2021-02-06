local telescope = require("telescope")

local U = require "utils"
local l = '<leader>'

U.KeyMap('n',l..'pw', ':lua require("telescope.builtin").grep_string{ search = vim.fn.expand("<cword>")}<CR>')
U.KeyMap('n',l..'ps', ':lua require("telescope.builtin").grep_string { search = vim.fn.input("Grep For > ")}<CR>')
U.KeyMap('n','<C-p>', ':lua require("telescope.builtin").git_files()<CR>')
U.KeyMap('n',l..'pb', ':lua require("telescope.builtin").buffers()<CR>')
U.KeyMap('n',l..'vh', ':lua require("telescope.builtin").help_tags()<CR>')

