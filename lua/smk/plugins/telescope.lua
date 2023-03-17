-- local lga_actions = require("telescope-live-grep-args.actions")
return
-- Fuzzy Finder (files, lsp, etc)
{
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    require('telescope').setup {

      defaults = {
        prompt_prefix = "🔭 ",
        path_display = { "truncate" },
        color_devicons = true
      },
      -- extensions = {
      --   live_grep_args = {
      --     auto_quoting = false, -- enable/disable auto-quoting
      --     -- define mappings, e.g.
      --     mappings = { -- extend mappings
      --       i = {
      --         ["<C-k>"] = lga_actions.quote_prompt(),
      --         ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
      --       },
      --     },
      --     -- ... also accepts theme settings, for example:
      --     -- theme = "dropdown", -- use dropdown theme
      --     -- theme = { }, -- use own theme spec
      --     -- layout_config = { mirror=true }, -- mirror preview pane
      --   }
      -- }
    }

    -- require('telescope').load_extension('fzf')


    local opts = { noremap = true, silent = true }

    -- Shorten function name
    local keymap = vim.keymap.set

    -- Find files using Telescope command-line sugar.
    keymap("n", "<leader>pf", builtin.find_files, opts)
    keymap("n", "<leader>ff", builtin.git_files, opts)
    keymap("n", "<leader>en", "<cmd>Telescope find_files cwd=~/AppData/local/nvim<cr>", opts)
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- keymap("n", "<leader>fg", function()
    --   builtin.grep_string({ string = vim.fn.input("Grep > ") })
    -- end)
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
  end,
}
