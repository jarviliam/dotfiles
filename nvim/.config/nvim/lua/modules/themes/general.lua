local config = require("conf")

if config.theme == "sonokai"
    or config.theme == "edge"
    or config.theme == "everforest"
then
  vim.g.sonokai_style = "atlantis"
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_diagnostic_text_highlight = 1
  vim.g.sonokai_diagnostic_virtual_text = "colored"

  vim.g.everforest_background = "medium"
  vim.g.everforest_enable_italic = 1
  vim.g.everforest_diagnostic_text_highlight = 1
  vim.g.everforest_diagnostic_virtual_text = "colored"
  vim.g.edge_style = "aura"
  vim.g.edge_better_performance = 1
  vim.g.edge_diagnostic_text_highlight = 1
  vim.g.edge_diagnostic_virtual_text = "colored"
  vim.cmd(string.format("colorscheme %s",config.theme))
end
