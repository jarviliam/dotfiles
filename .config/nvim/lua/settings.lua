local U = require "utils"
local g = vim.g
local go = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec

cmd("syntax on")
cmd("filetype plugin indent on")

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
opt.cmdheight      = 1     -- Height of the command bar
opt.incsearch      = true  -- Makes search act like search in modern browsers
opt.showmatch      = true  -- show matching brackets when text indicator is over them
opt.relativenumber = true  -- Show line numbers
opt.number         = true  -- But show the actual number for the line we're on
opt.ignorecase     = true  -- Ignore case when searching...
opt.smartcase      = true  -- ... unless there is a capital letter in the query
opt.hidden         = true  -- I like having buffers stay around
opt.cursorline     = true  -- Highlight the current line
opt.equalalways    = false -- I don't like my windows changing all the time
opt.splitright     = false  -- Prefer windows splitting to the right
opt.splitbelow     = true  -- Prefer windows splitting to the bottom
opt.updatetime     = 1000  -- Make updates happen faster
opt.hlsearch       = true  -- I wouldn't use this without my DoNoHL function
opt.scrolloff      = 10    -- Make it so there are always ten lines below my cursor

-- Tabs
opt.autoindent     = true
opt.cindent        = true
opt.wrap           = true

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

opt.belloff        = 'all' -- Just turn the dang bell off

opt.clipboard      = 'unnamedplus'

opt.inccommand     = 'split'
opt.swapfile       = false -- Living on the edge
opt.shada          = { "!", "'1000", "<50", "s10", "h" }

opt.mouse          = 'n'

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
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
opt.joinspaces = false         -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }


--[[
--Global Options
go.compatible = false
go.termguicolors = true
go.background = 'dark'
go.colorcolumn="80"

go.timeoutlen = 500
go.ttyfast = true

go.wildmenu = true

wo.number = true
wo.numberwidth = 6
wo.relativenumber = true
wo.signcolumn = "yes"

go.expandtab = true
go.smarttab = true
go.tabstop = 4
go.shiftwidth = 4
go.softtabstop = 4
go.cindent = true
go.autoindent = true
go.clipboard = "unnamedplus"
go.smartindent = true
wo.wrap = true
bo.textwidth = 300
bo.formatoptions = "qrn1"

go.hlsearch = true
go.ignorecase = true
go.smartcase = true

go.backup = false
go.writebackup = false
go.undofile = true
go.backupdir = "/tmp/"
go.directory = "/tmp/"
go.undodir = "/tmp/"

]]--

vim.cmd [[menu File.Save :w<CR>]]
vim.cmd [[menu File.Stop :q<CR>]]
-- For highlighting yanked region
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 120 })')
