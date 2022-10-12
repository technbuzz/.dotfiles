local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ctrl - S to save
--keymap("n", "<C-S>", ":update", opts)
-- there is problem with it so i have moved on

-- Change the escape key to jk
-- tnoremap jk <C-\><C-n>
keymap("i", "jk", "<Esc>", opts)
keymap("t", "jk", "<C-\\><C-n>", opts)

-- Normal
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better Tab Navigation
keymap("n", "<leader>l", ":tabnext<CR>", opts)
keymap("n", "<leader>h", ":tabpre<CR>", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Tabs 
keymap("n", "<C-t>", ":tabn", opts)
