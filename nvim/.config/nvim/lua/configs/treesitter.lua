 require("nvim-treesitter.configs").setup {
        ensure_installed = "maintained",
        ignore_install = {},
        highlight = {
            enable = true, -- false will disable the whole extension
            use_languagetree = true,
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-n>",
                node_incremental = "<C-n>",
                scope_incremental = "<C-s>",
            },
        },
    }

local parser = require('nvim-treesitter.parsers').get_parser_configs()
parser.terraform = {
    filetype = "tf",
    install_info = {
        url = "~/Documents/devops/tree-sitter-hcl",
        files = {"src/parser.c"}
    }
}
