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

-- Sync yanked text with system clipboard and vice versa
-- set.clipboard:prepend { 'unnamed', 'unnamedplus' }
