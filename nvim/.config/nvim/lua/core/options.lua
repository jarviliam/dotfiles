local opt = vim.opt

-------------- Timing {{{1
-----------------------------------------------------------------------------//
vim.opt.timeoutlen = as._default_num(vim.g.code_timeoutlen, 300)
vim.opt.updatetime = as._default_num(vim.g.code_updatetime, 300)
vim.opt.ttimeoutlen = 10

-----------------------------------------------------------------//
-- Theme {{{1
-----------------------------------------------------------------------------//
vim.cmd("set termguicolors")
vim.cmd("set background=dark")
vim.cmd("let g:everforest_background = 'hard'")
vim.cmd("colorscheme " .. as.select_theme(vim.g.code_colorscheme))

-- Window splitting and buffers {{{
opt.hidden = true
opt.splitbelow = true
opt.splitright = false
opt.switchbuf = "useopen,uselast"
opt.fillchars = {
	vert = "▕", -- alternatives │
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

-- }}}

-----------------------------------------------------------------------------//
-- Diff {{{
-- opt.diffopt = opt.diffopt:append {
--     "vertical",
--     "iwhite",
--     "hiddenoff",
--     "foldcolumn:0",
--     "context:4",
--     "algorithm:histogram",
--     "indent-heuristic",
-- }
-- }}}
-----------------------------------------------------------------------------//
-- Grep program {{{
if vim.fn.executable("rg") == 1 then
	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end
-- }}}
-----------------------------------------------------------------------------//
-- Display {{{
opt.colorcolumn = { as._default_num(vim.g.nv_colorcolumn, 0) }
opt.cmdheight = as._default_num(vim.g.nv_cmdheight, 2)
opt.scrolloff = as._default_num(vim.g.nv_scrolloff, 10)
opt.conceallevel = 0
opt.signcolumn = "yes:1"
opt.showbreak = [[↪ ]] -- Options include -> '…', '↳ ', '→','↪ '
--opt.showtabline = 2
opt.termguicolors = true
opt.guifont = "JetBrainsMono Nerd Font:h14"
opt.relativenumber = true
opt.cursorline = true
opt.title = true
opt.number = true
opt.numberwidth = 1
opt.confirm = true
opt.fileencoding = "utf-8"
opt.showmode = false
-- }}}
-----------------------------------------------------------------------------//
-- Indentation {{{

local indent = as._default_num(vim.g.nv_indent_size, 2)
opt.wrap = false
opt.tabstop = 8
opt.softtabstop = indent
opt.shiftwidth = indent
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
-- }}}
-----------------------------------------------------------------------------//
-- Search and Complete {{{
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.pumheight = as._default_num(vim.g.nv_compe_items, 10)
opt.completeopt = "menuone,noinsert,noselect"
-- }}}
-----------------------------------------------------------------------------//
-- Utils {{{
--vim.opt.shortmess = table.insert({},"c")
opt.shortmess = opt.shortmess + "c"
opt.iskeyword = opt.iskeyword + "-"
opt.path = opt.path + ".,**"
opt.clipboard = "unnamedplus"
opt.mouse = "n"
-- }}}

-----------------------------------------------------------------------------//
-- Folds {{{
vim.opt.foldlevelstart = 3
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
-- }}}

-----------------------------------------------------------------------------//
-- BACKUP AND SWAP {{{
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
-- }}}

--- Appearanc-----------------------------------------------------------------------------//
-- Wild and file globbing stuff in command mode {{{
vim.opt.wildignorecase = true -- Ignore case when completing file names and directories
vim.opt.wildmode = "full"
vim.opt.wildignore = {
	"*.aux",
	"*.out",
	"*.toc",
	"*.o",
	"*.obj",
	"*.dll",
	"*.jar",
	"*.pyc",
	"*.rbc",
	"*.class",
	"*.gif",
	"*.ico",
	"*.jpg",
	"*.jpeg",
	"*.png",
	"*.avi",
	"*.wav",
	"*.webm",
	"*.eot",
	"*.otf",
	"*.ttf",
	"*.woff",
	"*.doc",
	"*.pdf",
	"*.zip",
	"*.tar.gz",
	"*.tar.bz2",
	"*.rar",
	"*.tar.xz",
	".sass-cache",
	"*/vendor/gems/*",
	"*/vendor/cache/*",
	"*/.bundle/*",
	"*.gem",
	"*.*~",
	"*~ ",
	"*.swp",
	".lock",
	".DS_Store",
	"._*",
	"tags.lock",
}
-- }}}

vim.cmd("syntax on")
opt.belloff = "all" -- Kill It

-----------------------------------------------------------------------------//
-- Autocommands {{{1
as.check_and_set(vim.g.code_trim_trailing_space, "BufWritePre", "*", [[%s/\s\+$//e]])
as.check_and_set(vim.g.code_trim_trailing_space, "BufWritePre", "*", [[%s/\n\+\%$//e]])
as.check_and_set(vim.g.code_highlight_yank, "TextYankPost", "*", 'lua require"vim.highlight".on_yank{timeout = 250}')
as.check_and_set(
	vim.g.code_preserve_cursor,
	"BufReadPost",
	"*",
	[[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
)
as.check_and_set(vim.g.code_format_on_save, "BufWritePost", "*", "silent FormatWrite")

as.check_and_set("InsertLeave,BufWrite,BufEnter", "<buffer>", "lua vim.lsp.diagnostic.set_loclist({open = false})")

vim.cmd([[menu File.Save :w<CR>]])
vim.cmd([[menu File.Stop :q<CR>]])
vim.cmd([[menu File.Save :W<CR> ]])
vim.cmd([[menu File.Stop :Q<CR> ]])
