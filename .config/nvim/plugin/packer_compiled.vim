" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/liam/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n†\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\2\4\0'\3\5\0B\0\3\2K\0\1\0\6,\1\n\0\0\bcss\thtml\15javascript\tjson\ago\blua\rmarkdown\ash\tyaml\vconcat\ntable\19configs.format\frequire\0" },
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  gruvbox8 = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/gruvbox8"
  },
  ["lexima.vim"] = {
    config = { "\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0" },
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-language-server"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/lua-language-server"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18configs.compe\frequire\0" },
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\t6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\16configs.lsp\frequire\0" },
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs.treesitter\frequire\0" },
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/home/liam/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["snippets.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21configs.snippets\frequire\0" },
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22configs.telescope\frequire\0" },
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/liam/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

-- Config for: lexima.vim
try_loadstring("\27LJ\2\n4\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\5\22lexima_map_escape\6g\bvim\0", "config", "lexima.vim")
-- Config for: formatter.nvim
try_loadstring("\27LJ\2\n†\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\2\4\0'\3\5\0B\0\3\2K\0\1\0\6,\1\n\0\0\bcss\thtml\15javascript\tjson\ago\blua\rmarkdown\ash\tyaml\vconcat\ntable\19configs.format\frequire\0", "config", "formatter.nvim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs.treesitter\frequire\0", "config", "nvim-treesitter")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\t6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\16configs.lsp\frequire\0", "config", "nvim-lspconfig")
-- Config for: snippets.nvim
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21configs.snippets\frequire\0", "config", "snippets.nvim")
-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22configs.telescope\frequire\0", "config", "telescope.nvim")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18configs.compe\frequire\0", "config", "nvim-compe")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
