local opt = vim.opt
-- The Basics --
opt.hidden = true
opt.splitright = false
opt.splitbelow = true
opt.updatetime = 500

--Persistent Undo
opt.undofile = true

--Tabs --
opt.smartindent = true
opt.expandtab = true
opt.wrap = true
opt.autoindent = true

--Line Numbers --
opt.number         = true
opt.relativenumber = true

--Searching
opt.ignorecase     = true
opt.smartcase      = true

opt.wildmode = {'longest', 'list', 'full'}
opt.wildmode = opt.wildmode - 'list'
opt.wildmode = opt.wildmode + { 'longest', 'full' }
opt.wildoptions = 'pum'

--- Appearance
vim.cmd("syntax on")

opt.showmode= false -- Hide's the Mode
opt.termguicolors = true -- True Colours
opt.cursorline= true

opt.scrolloff = 10 --Start SCrolling When Near last 10
opt.sidescrolloff = 5

opt.foldmethod     = 'marker'
opt.foldlevel      = 0
opt.modelines      = 1

opt.fillchars = { eob = "~" } -- set Fill Chars =eob:~

-- Navigation
opt.mouse          = 'n'

-- Editing
opt.clipboard      = 'unnamedplus'
opt.joinspaces = false -- Single Space


-- Completion
opt.completeopt = "menu,menuone,noselect"
--opt.shortmess= opt.shortmess+"c"


opt.showcmd        = true
opt.cmdheight      = 1 -- Might Switch
opt.incsearch      = true
opt.showmatch      = true
opt.equalalways    = false

--Width's
opt.tabstop        = 4
opt.shiftwidth     = 4
opt.softtabstop    = 4

opt.belloff        = 'all' -- Kill It
opt.inccommand     = 'split'
opt.swapfile       = false

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17


opt.cc=80

--opt.tags = opt.tags .. ",./.git/tags"

--Commands

vim.cmd [[menu File.Save :w<CR>]]
vim.cmd [[menu File.Stop :q<CR>]]
--I Constantly Do this
vim.cmd [[menu File.Save :W<CR> ]]
vim.cmd [[menu File.Stop :Q<CR> ]]
