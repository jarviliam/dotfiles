filetype plugin indent on

lua require("core.global")
lua require("core.options")
lua require("core.mappings")
lua require("plugins")


"Recommended Settings for Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
