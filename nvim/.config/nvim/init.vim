let g:mapleader=" "
filetype plugin indent on

lua require("utils")
lua require("options")
lua require("mappings")
lua require("pack")

let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:everforest_background = 'hard'

set background=dark
set bg=dark

colorscheme everforest

"Term Colours"
if has('termguicolors')
    set termguicolors
endif

"Recommended Settings for Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
