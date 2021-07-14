local U = require "utils"
local l = '<leader>'

U.KeyMap("n","<C-k>",":cnext<CR>")
U.KeyMap("n","<C-j>",":cprev<CR>")
U.KeyMap("n",l.."k",":lnext<CR>")
U.KeyMap("n",l.."j",":lprev<CR>")
U.KeyMap("n","<C-q>", ":lua ToggleQF(1)<CR>")

local QFType = 0
local ToggleQF = function(type)
    if QFType == 0 then
    if type == 0 then
    end
    else
    end
    else
        if type ==0  then
            QFType = 0
        end
    end
end

