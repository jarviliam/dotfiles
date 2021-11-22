-- autocommands
local function au(au_type, where, dispatch)
	vim.cmd(string.format("au! %s %s %s", au_type, where, dispatch))
end

-- Autocommands
au("BufWritePre", "*", [[%s/\s\+$//e]])
au("BufWritePre", "*", [[%s/\n\+\%$//e]])
au("TextYankPost", "*", 'lua require"vim.highlight".on_yank{timeout = 250}')
au("InsertLeave,BufWrite,BufEnter", "<buffer>", "lua vim.lsp.diagnostic.set_loclist({open = false})")
au("BufReadPost", "*", "silent FormatWrite")
au("FileType help,qf,fugitive,fugitiveblame,netrw", "nnoremap <buffer><silent>", "q :close<CR>")
