-- local lga_actions = require("telescope-live-grep-args.actions")
return-- Fuzzy Finder (files, lsp, etc)
 {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
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
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        live_grep_args = {
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
        }
      }
    }

    -- require('telescope').load_extension('fzf')

    pcall(require('telescope').load_extension('fzf'))

    local opts = { noremap = true, silent = true }

    -- Shorten function name
    local keymap = vim.keymap.set

    -- Find files using Telescope command-line sugar.
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    keymap("n", "<leader>pf", builtin.find_files, opts)
    keymap("n", "<leader>en", "<cmd>Telescope find_files cwd=~/AppData/local/nvim<cr>", opts)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>fb', function()
      builtin.buffers({
        sort_lastused = true
      })
    end
      , { desc = '[F]ind existing [B]uffers' })
    -- keymap("n", "<leader>fg", function()
    --   builtin.grep_string({ string = vim.fn.input("Grep > ") })
    -- end)
  end,
}
