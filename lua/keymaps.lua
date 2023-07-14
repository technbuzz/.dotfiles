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

-- jump scroll but won't keep cursor in the middle
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

-- vsnip jump through snippets with <Tab>
keymap("i", "<Tab>", [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']], { noremap = false, expr = true })
keymap("s", "<Tab>", [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']], { noremap = false, expr = true })
keymap( "i", "<S-Tab>", [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], { noremap = false, expr = true })
keymap( "s", "<S-Tab>", [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], { noremap = false, expr = true })
--

--  TODO README FIX THE INCONSISTENCY OF USING SET
-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Custom Mapping for Angular and stuff
keymap("n", "<leader>jm", "<cmd>lua require('custom.angular').jump_to_nearest_module()<cr>", opts)
keymap("n", "<leader>jc", "<cmd>lua require('custom.angular').jump_to_angular_component_part('ts')<cr>", opts)
keymap("n", "<leader>jt", "<cmd>lua require('custom.angular').jump_to_angular_component_part('html')<cr>", opts)
keymap("n", "<leader>js", "<cmd>lua require('custom.angular').jump_to_angular_component_part('scss')<cr>", opts)

-- Better Tab Navigation
-- keymap("n", "<leader>l", ":tabnext<CR>", opts)
keymap("n", "<leader>h", ":tabpre<CR>", opts)
keymap("n", ",sz", "echo 'Goodbye'", opts)

local function saveExec()
  return "<Cmd>write<CR> <Cmd>source %<CR>"
end

local function testLuaFile()
  if vim.bo.filetype == "lua" then
    -- return "<Plug>PlenaryTestFile"
    return "sami"
  end
end

-- Plug dev, saves and sources current file
keymap("n", "<leader><leader>x", saveExec(), opts)
keymap("n", "<leader>t", "<Plug>PlenaryTestFile", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

