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

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
-- Currently coliding by go to definition lsp
-- keymap("v", "K", ":m '>-2<CR>gv=gv", opts)


-- Join line without jumping the cursor
keymap("n", "J", "mzJ`z", opts)

-- jump scroll but won't always keep cursor in the middle
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Normal
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Copy Paste Global
keymap("n", "<leader>y", '"*y', opts)
keymap("v", "<leader>y", '"*y', opts)
-- Paste while preserving copied item
keymap("x", "<leader>p", "\"_dP", opts)
-- delete to void register 
keymap("v", "<leader>d", "\"_d", opts)
keymap("n", "<leader>d", "\"_d", opts)

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

