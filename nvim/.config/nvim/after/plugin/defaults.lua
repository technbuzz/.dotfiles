local set = vim.opt

set.number = true
set.relativenumber = true
set.laststatus = 2
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
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
-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Fold with Treesitter
set.foldlevel = 20
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"


local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd('TermOpen', {
  group = augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false;
    vim.opt.relativenumber = false;
  end
})

-- local keymap = vim.api.nvim_set_keymap
local job_id = 0
local buffer_path = ""

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
  job_id = vim.bo.channel
  buffer_path = vim.bo.path

end, { desc = "Open Terminal" })


vim.keymap.set("n", "<space>as", function()
  -- vim.fn.chansend(job_id, { "echo hi\r\n" })
  -- vim.fn.chansend(job_id, { "ng g @angular/core:ng-update --help\r\n" })
  local command = string.format("ng g @angular/core:signal-input-migration --path %s\r\n", buffer_path)
  vim.fn.chansend(job_id, { "cd apps/ui\r\n" })
  vim.fn.chansend(job_id, { command })
end)
