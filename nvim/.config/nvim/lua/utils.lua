local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local Utils = {}

-- Key mapping
-- vim.api.nvim_set_keymap('n', '<leader><Space>', ':set hlsearch!<CR>', { noremap = true, silent = true })
-- :nnoremap <silent> <leader><Space> :set hlsearch<CR>
--
function Utils.KeyMap(mode,key,command,options)
    --Keep leftmost table
    options = vim.tbl_extend('keep', options or {}, {
        noremap = true,
        silent = true,
        expr = false
    })
    api.nvim_set_keymap(mode,key,command,options)
end

function Utils.highlights(hi_table)
    for group, styles in pairs(hi_table) do
        Utils.highlight(group, styles)
    end
end

function Utils.hiLink(src, dest)
    cmd('highlight link '..src..' '..dest)
end

function Utils.hiLinks(hi_table)
    for src, dest in pairs(hi_table) do
        Utils.hiLink(src, dest)
    end
end

return Utils
