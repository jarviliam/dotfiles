:lua require("globals")
:lua require("settings")
":lua require("bluetooth")

call plug#begin('~/.vim/plugged')
	"The classics"
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'tjdevries/nlua.nvim'
    Plug 'tjdevries/lsp_extensions.nvim'

    Plug 'nvim-lua/lsp-status.nvim'

    "Snippets"
    Plug 'norcalli/snippets.nvim'

    "Tree-Sitter"
    Plug 'nvim-treesitter/nvim-treesitter', {'do' : ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'vim-utils/vim-man'

    "Tpope stuff"
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-dispatch'

    "Undo"
    Plug 'mbbill/undotree'

    "FZF"
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'

    "Telescope"
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/telescope.nvim'

    "Closing brackets
    Plug '9mm/vim-closer'

    "Themes"
    Plug 'lifepillar/gruvbox8'
    Plug 'arcticicestudio/nord-vim'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'jarviliam/lualine.nvim'
call plug#end()

let mapleader = " "
colorscheme nord
"let g:gruvbox_contrast_dark = 'hard'
set  bg=dark
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

packadd nvim-treesitter
"
"Basically the Side Project Menu Window
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_localrmdir='rm -r'

:lua require("mappings")
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

" <c-k> will either expand the current snippet at the word or try to jump to
" the next position for the snippet.
inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>

inoremap <C-c> <esc>

" <c-j> will jump backwards to the previous field.
" If you jump before the first field, it will cancel the snippet.
inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

:lua require("lsp")
:lua require("snippets-config")
:lua require("lsp_status")
":lua require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true } }


command! Format execute 'lua vim.lsp.buf.formatting()'

let g:gruvbox_italicize_strings = 1


"Recommended Settings for Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Matching Strategy
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

autocmd BufWritePre * :call TrimWhitespace()
