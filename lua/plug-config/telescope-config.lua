require('telescope').setup{
  defaults = {
    prompt_prefix = "🔭 ",
    path_display = {"smart"}
  }
}

require('telescope').load_extension('fzf')

 
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
 
-- Find files using Telescope command-line sugar.
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>en", "<cmd>Telescope find_files cwd=~/AppData/local/nvim<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
