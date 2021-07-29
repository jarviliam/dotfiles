local g = vim.g

-----------------------------------------------------------------------------//
--- General Settings
-----------------------------------------------------------------------------//
g.nv_timeoutlen = 300
g.nv_colorcolumn = 0
g.nv_cmdheight = 1
g.nv_updatetime = 300
g.nv_scrolloff = 10
g.nv_relativenumber = true
g.nv_cursorline = true
g.nv_word_wrap = false
g.nv_preserve_cursor = true
g.nv_highlight_yank = true
g.nv_listchars = false
g.nv_indent_guides = false
g.nv_explorer_side = "right"
g.nv_format_on_save = true
g.nv_trim_trailing_space = true
g.nv_indent_size = 4

-----------------------------------------------------------------------------//
--- Completion
-----------------------------------------------------------------------------//
g.nv_compe_enabled = true
g.nv_compe_doc_window = "single"
g.nv_compe_autopairs = true
g.nv_compe_items = 10
g.nv_compe_sources_blacklist = {}

-----------------------------------------------------------------------------//
--- Treesitter
-----------------------------------------------------------------------------//
g.nv_treesitter_enabled = true
g.nv_treesitter_parsers_install = "maintained"

-----------------------------------------------------------------------------//
--- LSP
-----------------------------------------------------------------------------//
g.nv_lsp_enabled = true
g.nv_lsp_virtual_text = false
g.nv_lsp_win_borders = "double"
g.nv_lsp_diagnostic_signs = true
g.nv_lsp_document_highlight = false
g.nv_lsp_diagnostic_underline = true
g.nv_lsp_autostart_blacklist = { "lua" }

-----------------------------------------------------------------------------//
--- Colors/Style
-----------------------------------------------------------------------------//
-- Press <space>ft to see all available themes
g.nv_colorscheme = "neon"
-- See :h themes-nvim for help
g.themes_italic_comment = true
g.themes_italic_keyword = true
g.themes_italic_boolean = true
g.themes_italic_function = true
g.themes_italic_variable = false
-- @options: classic, arrow, slant
g.nv_statusline = "classic"
-- @options: gruvbox, nv, nord, wombat
g.nv_statusline_color = "neon"
