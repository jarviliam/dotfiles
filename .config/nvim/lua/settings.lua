vim.cmd("syntax on")
vim.cmd("set nocp")
vim.cmd("filetype plugin indent on")

local opt = vim.opt

opt.wildmode = {'longest', 'list', 'full'}

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - 'list'
opt.wildmode = opt.wildmode + { 'longest', 'full' }

opt.wildoptions = 'pum'
opt.termguicolors = true

opt.showmode       = false
opt.showcmd        = true
opt.cmdheight      = 1
opt.incsearch      = true
opt.showmatch      = true
opt.relativenumber = true
opt.number         = true
opt.ignorecase     = true
opt.smartcase      = true
opt.hidden         = true --Hide's Buffers
opt.cursorline     = true
opt.equalalways    = false
opt.splitright     = false
opt.splitbelow     = true
opt.updatetime     = 1000
opt.scrolloff      = 10

-- Tabs
opt.autoindent     = true
opt.cindent        = true
opt.wrap           = true

--Width's
opt.tabstop        = 4
opt.shiftwidth     = 4
opt.softtabstop    = 4
opt.expandtab      = true

opt.breakindent    = true
opt.showbreak      = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak      = true

opt.foldmethod     = 'marker'
opt.foldlevel      = 0
opt.modelines      = 1

opt.belloff        = 'all'

opt.clipboard      = 'unnamedplus'

opt.inccommand     = 'split'
opt.swapfile       = false
opt.shada          = { "!", "'1000", "<50", "s10", "h" }

opt.mouse          = 'n'

opt.formatoptions = opt.formatoptions
                    - 'a'     -- Auto formatting is BAD.
                    - 't'     -- Don't auto format my code. I got linters for that.
                    + 'c'     -- In general, I like it when comments respect textwidth
                    + 'q'     -- Allow formatting comments w/ gq
                    - 'o'     -- O and o, don't continue comments
                    + 'r'     -- But do continue when pressing enter.
                    + 'n'     -- Indent past the formatlistpat, not underneath it.
                    + 'j'     -- Auto-remove comments if possible.
                    - '2'     -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

opt.cc=80

vim.cmd [[menu File.Save :w<CR>]]
vim.cmd [[menu File.Stop :q<CR>]]
