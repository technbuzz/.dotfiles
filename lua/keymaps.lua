local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ctrl - S to save
keymap("n", "<C-s>", "<cmd>:update<CR>", opts)
keymap("i", "<C-s>", "<Esc><cmd>:update<CR>", opts)

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

-- Copy Paste Global
keymap("n", "<leader>y", '"*y', opts)
keymap("v", "<leader>y", '"*y', opts)

 -- Jump forward or backward
keymap("n", "Tab", "vsnip#jumpable(1) ? <Plug>(vsnip-jump-next)", opts )
-- imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
--

-- Better Tab Navigation
keymap("n", "<leader>l", ":tabnext<CR>", opts)
keymap("n", "<leader>h", ":tabpre<CR>", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

