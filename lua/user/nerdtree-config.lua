local opts = { noremap = true, silent = true }
local api = vim.api

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-b>", ":NERDTreeToggle<cr>", opts)
keymap("n", "<leader>n", ":NERDTreeFocus<cr>", opts)

-- sync open file with NERDTree
-- Check if NERDTree is open or active
-- function IsNERDTreeOpen()        
--   return api.exists("t:NERDTreeBufName") and (api.bufwinnr(api.t:NERDTreeBufName) ~= -1)
-- end

-- Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
-- file, and we're not in vimdiff
-- function SyncTree()
--   if &modifiable && IsNERDTreeOpen() and strlen(expand('%')) > 0 && !&diff
--     NERDTreeFind
--     wincmd p
--   end
-- end
--
-- vim.api.nvim_create_autocmd(
--
-- )
