" Neovim Config

let g:mapleader=" "
filetype plugin indent on
set bg=dark

lua require'globals'
lua require'settings'
lua require("mappings")
lua require("plugins")

"let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai
"
"NetRW"
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_localrmdir='rm -r'

"Term Colours"
if has('termguicolors')
    set termguicolors
endif

"if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

"Recommended Settings for Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>


"Recompile"
function s:recompile_plugins()
    luafile %
    PackerCompile
endfunction

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup recompile_plugins
    autocmd BufWritePost plugins.lua call <SID>recompile_plugins()
augroup END

"Ol Highlight
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
autocmd BufWritePre * :call TrimWhitespace()
