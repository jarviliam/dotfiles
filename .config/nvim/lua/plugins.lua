local packer = nil
local function load()
    if packer == nil then
        packer = require('packer')
        packer.init({disable_commands = true})
    end

    local use = packer.use
    packer.reset()
    --Packer
      use {'wbthomason/packer.nvim', opt = true}

  end
