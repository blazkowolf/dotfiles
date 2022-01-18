-- Inspiration from tjdevries
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/first_load.lua

local empty = function(thing)
  return vim.fn.empty(thing) == 1
end

local has = function(feature)
  return vim.fn.has(feature) == 1
end

local data_dir = string.format("%s/site", vim.fn.stdpath("data"))

local download_vim_plug = function()
  local plug_download_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  local cmd_str = has("win32")
    and string.format([[Invoke-WebRequest -UseBasicParsing %s | New-Item "%s/autoload/plug.vim" -Force]], plug_download_url, data_dir)
    or string.format("curl -fLo %s/autoload/plug.vim --create-dirs %s", data_dir, plug_download_url)
  print(cmd_str)

  local out = vim.fn.system(cmd_str)
  print(out)
  print("(Downloading Vim-Plug...)")

  vim.cmd([[autocmd VimEnter * PlugInstall --sync | execute "source" stdpath("config") . '/init.lua']])
end

local M = {}

-- TODO replace vim-plug with Packer
M.load = function(plugin_download_dir)
  plugin_download_dir = plugin_download_dir or vim.fn.stdpath("data") .. "/plugged"

  -- Perform interstitial safeguard check for Vim-Plug
  -- Adapted from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
  if empty(vim.fn.glob(data_dir .. "/autoload/plug.vim")) then
    download_vim_plug()
  end

  vim.fn["plug#begin"](plugin_download_dir)
  vim.cmd([[
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'rust-lang/rust.vim'
  execute "source" stdpath('config') . '/plugins/fzf.vim'
  execute "source" stdpath('config') . '/plugins/gruvbox.vim'
  execute "source" stdpath('config') . '/plugins/nerdcommenter.vim'
  execute "source" stdpath('config') . '/plugins/nerdtree.vim'
  execute "source" stdpath('config') . '/plugins/vim-airline.vim'
  ]])
  -- `plug#end` automatically executes `filetype plugin indent on` and `syntax enable`
  vim.fn["plug#end"]() 

  vim.cmd("doautocmd User PlugLoaded")
end

return M
