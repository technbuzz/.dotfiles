local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-b>", ":NERDTreeToggle<cr>", opts)
keymap("n", "<leader>n", ":NERDTreeFocus<cr>", opts)
