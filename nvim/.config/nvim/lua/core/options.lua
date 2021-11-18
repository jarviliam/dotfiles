local options = vim.opt
vim.cmd([[syntax enable]])
vim.cmd([[filetype plugin indent on]])
vim.cmd("set termguicolors")
vim.cmd("set background=dark")
vim.cmd("let g:everforest_background = 'hard'")
vim.cmd("colorscheme everforest")

options.mouse = "" -- disable the mouse
options.exrc = false -- ignore '~/.exrc'
options.secure = true
options.modelines = 1 -- read a modeline at EOF
options.errorbells = false -- disable error bells (no beep/flash)
options.termguicolors = true -- enable 24bit colors

options.updatetime = 250 -- decrease update time
options.autoread = true -- auto read file if changed outside of vim
options.fileformat = "unix" -- <nl> for EOL
options.switchbuf = "useopen"
options.encoding = "utf-8"
options.fileencoding = "utf-8"
options.backspace = "indent,eol,start"

-- recursive :find in current dir
vim.cmd([[set path=.,,,$PWD/**]])

-- vim clipboard copies to system clipboard
-- unnamed     = use the " register (cmd-s paste in our term)
-- unnamedplus = use the + register (cmd-v paste in our term)
options.clipboard = "unnamedplus"

options.showmode = true -- show current mode (insert, etc) under the cmdline
options.showcmd = false -- show current command under the cmd line
options.cmdheight = 2 -- cmdline height
options.laststatus = 2 -- 2 = always show status line (filename, etc)
options.scrolloff = 5 -- min number of lines to keep between cursor and screen edge
options.sidescrolloff = 15 -- min number of cols to keep between cursor and screen edge
options.textwidth = 78 -- max inserted text width for paste operations
options.linespace = 0 -- font spacing
options.ruler = true -- show line,col at the cursor pos
options.number = true -- show absolute line no. at the cursor pos
options.relativenumber = true -- otherwise, show relative numbers in the ruler
options.cursorline = true -- Show a line where the current cursor is
vim.wo.signcolumn = "yes:1" -- Show sign column as first column
vim.g.colorcolumn = "+1"
options.wrap = true -- wrap long lines
options.breakindent = true -- start wrapped lines indented
options.linebreak = true -- do not break words on line wrap

-- invisible characters to use on ':set list'
options.listchars = {
	tab = "→ ",
	eol = "↲",
	nbsp = "␣",
	trail = "•",
	extends = "⟩",
	precedes = "⟨",
	space = "␣",
}
options.showbreak = "↪ "

-- show menu even for one item do not auto select/insert
options.completeopt = "noinsert,menuone,noselect"
options.wildmenu = true
options.wildmode = "longest:full,full"
options.wildoptions = "pum" -- Show completion items using the pop-up-menu (pum)
options.pumblend = 15 -- completion menu transparency

options.joinspaces = true -- insert spaces after '.?!' when joining lines
options.autoindent = true -- copy indent from current line on newline
options.smartindent = true -- add <tab> depending on syntax (C/C++)
options.startofline = false -- keep cursor column on navigation

options.tabstop = 4 -- Tab indentation levels every two columns
options.softtabstop = 4 -- Tab indentation when mixing tabs & spaces
options.shiftwidth = 4 -- Indent/outdent by two columns
options.shiftround = true -- Always indent/outdent to nearest tabstop
options.expandtab = true -- Convert all tabs that are typed into spaces
options.smarttab = true -- Use shiftwidths at left margin, tabstops everywhere else

options.splitbelow = true -- ':new' ':split' below current
options.splitright = true -- ':vnew' ':vsplit' right of current

options.foldenable = true -- enable folding
options.foldlevelstart = 10 -- open most folds by default
options.foldnestmax = 10 -- 10 nested fold max
options.foldmethod = "indent" -- fold based on indent level

options.undofile = false -- no undo file
options.hidden = true -- do not unload buffer when abandoned
options.autochdir = false -- do not change dir when opening a file

options.magic = true --  use 'magic' chars in search patterns
options.hlsearch = true -- highlight all text matching current search pattern
options.incsearch = true -- show search matches as you type
options.ignorecase = true -- ignore case on search
options.smartcase = true -- case sensitive when search includes uppercase
options.showmatch = true -- highlight matching [{()}]
options.inccommand = "nosplit" -- show search and replace in real time
options.autoread = true -- reread a file if it's changed outside of vim
options.wrapscan = true -- begin search from top of the file when nothng is found
--options.cpoptions = options.cpoptions .. "x" -- stay at seach item when <esc>

options.backup = false -- no backup file
options.writebackup = false -- do not backup file before write
options.swapfile = false -- no swap file

-- use ':grep' to send resulsts to quickfix
-- use ':lgrep' to send resulsts to loclist
if vim.fn.executable("rg") == 1 then
	options.grepprg = "rg --vimgrep --no-heading --smart-case --hidden"
	options.grepformat = "%f:%l:%c:%m"
end

-- Disable providers we do not care a about
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Disable some in built plugins completely
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
	--'matchparen',
}
for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.g.markdown_fenced_languages = {
	"vim",
	"lua",
	"cpp",
	"sql",
	"python",
	"bash=sh",
	"console=sh",
	"javascript",
	"typescript",
	"js=javascript",
	"ts=typescript",
	"yaml",
	"json",
}

-----------------------------------------------------------------------------//
-- Autocommands {{{1
as.nvim_set_au("BufWritePre", "*", [[%s/\s\+$//e]])
as.nvim_set_au("BufWritePre", "*", [[%s/\n\+\%$//e]])
as.nvim_set_au("TextYankPost", "*", 'lua require"vim.highlight".on_yank{timeout = 250}')
as.nvim_set_au("InsertLeave,BufWrite,BufEnter", "<buffer>", "lua vim.lsp.diagnostic.set_loclist({open = false})")
as.nvim_set_au("BufReadPost", "*", "silent FormatWrite")
as.nvim_set_au("FileType help,qf,fugitive,fugitiveblame,netrw", "nnoremap <buffer><silent>", "q :close<CR>")
vim.cmd([[menu File.Save :w<CR>]])
vim.cmd([[menu File.Stop :q<CR>]])
vim.cmd([[menu File.Save :W<CR> ]])
vim.cmd([[menu File.Stop :Q<CR> ]])
