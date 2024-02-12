require('keymaps')
-- require('./lazyplugs')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
-- require('plug-config/nx-config')
-- require('theme-config')
-- require('plug-config/gruvbox-config')
-- require('plug-config/nvimtree-config')
require('plug-config/neotree-config')
--require('plug-config/toggleterm-config')
-- require('ts-config')
