local ok, neogen = as.safe_require("neogen")
if not ok then
return
end

local map = vim.keymap.set
neogen.setup{enabled = true}
map('n','<leader>og',neogen.generate, {silent = true, desc="neogen: generate"})
map('n','<leader>of',"require('neogen').generate({type = 'func'})", {silent = true, desc="neogen: generate function"})
map('n','<leader>oc',"require('neogen').generate({type = 'class'})", {silent = true, desc="neogen: generate class"})
