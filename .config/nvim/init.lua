-- 1. Enable Syntax Highlighting
vim.cmd('syntax on')

-- 2. Set a built-in colorscheme (try 'habamax', 'retrobox', or 'lunaperch')
vim.cmd('colorscheme habamax') 

-- 3. Basic Settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative numbers
vim.opt.scrolloff = 8         -- Scroll padding
vim.opt.ignorecase = true     -- Case insensitive search
vim.opt.smartcase = true      -- Smart case search


-- Force Neovim to use OSC 52 for the clipboard
-- this is for copying from mosh host (fedora) to client's clipboard(mac)
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- Automatically use system clipboard for all yanks
vim.opt.clipboard = "unnamedplus"

