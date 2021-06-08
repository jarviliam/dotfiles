--Bootstraps Packer
local pp = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(pp)) then
    vim.fn.system {
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        pp
}
vim.cmd("packadd packer.nvim")
end

return require("packer").startup {
    function()
        use {"wbthomason/packer.nvim", opt = true}

    use { "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
           require("configs.treesitter")
        end
    }
    use {
        "hoob3rt/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("configs.lualine")
        end
    }
    use {
        "sumneko/lua-language-server"
    }
    use {
        "neovim/nvim-lspconfig",
        requires = {"glepnir/lspsaga.nvim"},
        config = function()
            require("configs.lsp")
            require("lspsaga").init_lsp_saga()
    end
    }
    use {
        "kyazdani42/nvim-tree.lua",
    }

    --[[use {
        "mfussenegger/nvim-jdtls",
        config = function()
            require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
        end
}]]--
    use "tpope/vim-surround"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"

    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    use "mbbill/undotree"
    use {
        "norcalli/snippets.nvim",
        config = function()
            require("configs.snippets")
        end
        }
    use {
        "mhartington/formatter.nvim",
        config = function()
            require("configs.format")
            --AutoCMD on Save
            local filetypes =
            table.concat({
                "css","html","javascript","json","go","lua","markdown","sh","yaml","scss"
            },",")
            --[[
            vim.api.nvim_command("augroup format_map")
            vim.api.nvim_command("autocmd!")
            vim.api.nvim_command("autocmd FileType " .. filetypes .. " nnoremap <buffer> <silent> gf :Format<CR>")
            vim.api.nvim_command("augroup end")]]
        end
        }
        use {
            "hrsh7th/nvim-compe",
            config = function()
                require("configs.compe")
            end
        }

    use {
        "cohama/lexima.vim",
        config = function()
            vim.g.lexima_map_escape = ""
        end
    }
    use {'b3nj5m1n/kommentary', config = require'configs.comment'.config()}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim"
    },config = function()
        require("configs.telescope")
    end
    }

    use {"lukas-reineke/indent-blankline.nvim", branch="lua"}

    --Themes
    use "sainnhe/sonokai"
    use 'kyazdani42/blue-moon'
    use "arcticicestudio/nord-vim"
    use "lifepillar/gruvbox8"
end
}