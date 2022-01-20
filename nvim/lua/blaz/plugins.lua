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

  local cmd_str = string.format("curl -fLo %s/autoload/plug.vim --create-dirs %s", data_dir, plug_download_url)
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

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'morhetz/gruvbox'

  Plug 'preservim/nerdcommenter'

  Plug 'neovim/nvim-lspconfig'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'rust-lang/rust.vim'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " nvim-cmp requires a snippet engine
  Plug 'L3MON4D3/LuaSnip'
  " LuaSnip completion source for nvim-cmp
  Plug 'saadparwaiz1/cmp_luasnip'

  Plug 'tpope/vim-fugitive'

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  ]])
  -- `plug#end` automatically executes `filetype plugin indent on` and `syntax enable`
  vim.fn["plug#end"]() 

  -- vim.cmd("doautocmd User PlugLoaded")

  -- FZF malarchy
  vim.api.nvim_set_keymap("n", "<C-p>", ":GFiles<CR>", { noremap = true })
  vim.g.fzf_action = {
    ["ctrl-t"] = "tab split",
    ["ctrl-s"] = "split",
    ["ctrl-v"] = "vsplit"
  }
  vim.g.fzf_preview_window = { "right:50%", "ctrl-/" }

  -- Gruvbox crap
  vim.cmd("colorscheme gruvbox")

  -- NERDCommenter waste
  vim.g.NERDCreateDefaultMappings = 1  -- Create default mappings
  vim.g.NERDSpaceDelims = 1            -- Add spaces after comment delimiters by default
  vim.g.NERDCompactSexyComs = 1        -- Use compact syntax for prettified multi-line comments
  vim.g.NERDDefaultAlign = "left"      -- Align line-wise comment delimiters flush left instead of following code indentation
  vim.g.NERDAltDelims_java = 1         -- Set a language to use its alternate delimiters by default
  vim.g.NERDCommentEmptyLines = 1      -- Allow commenting and inverting empty lines (useful when commenting a region)
  vim.g.NERDTrimTrailingWhitespace = 1 -- Enable trimming of trailing whitespace when uncommenting
  vim.g.NERDToggleCheckAllLines = 1    -- Enable NERDCommenterToggle to check all selected lines is commented or not 
  -- Add your own custom formats or override the defaults
  vim.g.NERDCustomDelimiters = {
    ["c"] = {
      ["left"] = "/**",
      ["right"] = "*/"
    }
  }

  -- NERDTree feces
  vim.g.NERDTreeDirArrowExpandable = "▶"
  vim.g.NERDTreeDirArrowCollapsible = "▼"
  vim.g.NERDTreeHighlightFolders = 1
  vim.g.NERDTreeHighlightFoldersFullName = 1
  vim.g.NERDTreeShowHidden = 1
  vim.g.NERDTreeMinimalUI = 1 -- Hide ?
  vim.g.NERDTreeIgnore = { "^node_modules$" }
  vim.g.NERDTreeStatusline = "" -- Use lightline
  vim.g.plug_window = "noautocmd vertical topleft new"
  vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
  vim.g.DevIconsEnableFoldersOpenClose = 1
  vim.g.DevIconsEnableFolderExtensionPatternMatching = 1

  vim.api.nvim_set_keymap(
    "n",
    "<C-b>",
    [[g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>']],
    { noremap = true, expr = true }
  )

  vim.api.nvim_set_keymap("n", "<leader>N", ":NERDTreeFind<CR>", {})

  -- If more than one window and previous buffer was NERDTree, go back to it
  vim.cmd([[autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif]])

  -- Close window if NERDTree is the last thing open
  vim.cmd([[autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && NERDTree.isTabTree()) | q | endif]])

  -- vim-airline rubbish
  vim.g.airline_theme = "base16_gruvbox_dark_soft"
end

return M
