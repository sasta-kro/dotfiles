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

-- check if nvim is in an SSH or Mosh session
local is_remote = os.getenv('SSH_TTY') ~= nil or os.getenv('SSH_CONNECTION') ~= nil or os.getenv('MOSH_SERVER_PID') ~= nil

if is_remote then
  -- if on Fedora/Remote: Use OSC 52 to talk to the local clipboard
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
else
  -- if on Mac/Local: Do nothing. 
  -- neovim will automatically find `pbcopy` and `pbpaste` and it will just work.
end

-- Automatically use system clipboard for all yanks
vim.opt.clipboard = "unnamedplus"

