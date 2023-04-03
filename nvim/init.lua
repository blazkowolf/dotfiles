-- ███   █    ██   ▄▄▄▄▄▄   █  █▀ ████▄   ▄ ▄   ████▄ █    ▄████  
-- █  █  █    █ █ ▀   ▄▄▀   █▄█   █   █  █   █  █   █ █    █▀   ▀ 
-- █ ▀ ▄ █    █▄▄█ ▄▀▀   ▄▀ █▀▄   █   █ █ ▄   █ █   █ █    █▀▀    
-- █  ▄▀ ███▄ █  █ ▀▀▀▀▀▀   █  █  ▀████ █  █  █ ▀████ ███▄ █      
-- ███       ▀   █            █          █ █ █            ▀ █     
--              █            ▀            ▀ ▀                ▀    
--             ▀                                                  

vim.g.mapleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)
vim.g.maplocalleader = vim.api.nvim_replace_termcodes("<space>", true, true, true)

require("blaz.globals")
require("blaz.editor")
require("blaz.keymap")
require("blaz.plugins").load()

-- The following must be `required` after plugins load
require("blaz.lsp")
