local set = vim.opt

set.number = true
set.relativenumber = true
set.laststatus= 2
set.tabstop= 2
set.softtabstop= 2
set.shiftwidth= 2
set.expandtab = true
set.smartindent = true
set.title = true

-- This was from the colorscheme section
-- enable true colors support
set.termguicolors = true
set.background = 'dark'

set.scrolloff = 8

set.hlsearch = false

set.wrap = false
set.colorcolumn = '80'

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
set.updatetime = 50

-- Search Setting
set.ignorecase = true
set.smartcase = true

set.cursorline = true
-- Sync yanked text with system clipboard and vice versa
-- set.clipboard:prepend { 'unnamed', 'unnamedplus' }
