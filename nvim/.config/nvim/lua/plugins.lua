return {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'xiyaowong/transparent.nvim',
    event = "VeryLazy"
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = {
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_x = {
          -- function()
          --   return   vim.fn["codeium#GetStatusString"]()
          -- end
          {
            'vim.fn["codeium#GetStatusString"]()',
            fmt = function(str)
              return "suggestions: " .. str:lower():match("^%s*(.-)%s*$")
            end
          },
          'encoding', 'fileformat', 'filetype'
        }
      }
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    -- branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "DavidBabel/vscode-simpler-icons",
      -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },


  -- add annotations currently the key nf collides with
  -- neotree <leader>n
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      }
    },
    config = function()
      local harpoon = require("harpoon")

      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "[A]dd File Mark" })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "View All Project Marks" })
    end,
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',

    event = "VeryLazy",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,

  },
  -- Lazy
  --
  {
    'Exafunction/codeium.vim',
    event = "VeryLazy",

    config = function()
      vim.keymap.set("i", "<C-l>", function() return vim.fn['codeium#Accept']() end, { expr = true })
      -- vim.keymap.set("i", "<C-;>", function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      -- vim.keymap.set("i", "<C-,>", function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    end
  },
  -- {
  --   "sourcegraph/sg.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  -- },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "VeryLazy",

    dependencies = "nvim-treesitter/nvim-treesitter",
    -- ignore certain file types
    -- opts = {
    --   on_attach = function(bufnr)
    --     return vim.bo[bufnr].filetype == 'neotree'
    --   end
    -- }
  },
  -- { 'mattn/emmet-vim', event = "VeryLazy", },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { 'tpope/vim-fugitive',    event = "VeryLazy", },
  -- { doesn't works properly need to hceck the plugin docs
  --   "folke/flash.nvim",
  -- },
  --
  -- { 'subnut/nvim-ghost.nvim' },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",

    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require 'nvim-web-devicons'.setup {}
      require("trouble").setup {
        icons = false,
        use_diagnostic_signs = true,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }

      -- Lua
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
    end
  },
  -- Promising plugin but not working for me
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --     opts = {
  --     },
  --     config = function()
  --
  --       vim.keymap.set(
  --         "",
  --         "<Leader>l",
  --         require("lsp_lines").toggle,
  --         { desc = "Toggle lsp_lines" }
  --       )
  --     end
  -- },
  -- MISC
  {
    -- mini surround
    'echasnovski/mini.nvim',
    event = "VeryLazy",
    config = function()
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
    end

  },
  {
    'mbbill/undotree',
    event = "VeryLazy",

    config = function()
      vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')
    end
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {},
    event = "VeryLazy",
  },
  -- {
  --   event = "VeryLazy",
  --
  --   dependencies = { 'nvim-lua/plenary.nvim' }
  -- },
  { 'wakatime/vim-wakatime', event = "VeryLazy", },
  -- Plug '~/desktop/practice/deleteme/nvim-plugins/ngutils.nvim'
  -- Dev Tools
  -- Not working properly
  {
    'Equilibris/nx.nvim',
    event = "VeryLazy",

    dependencies = 'nvim-telescope/telescope.nvim',
    opts = {}
  },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'folke/neodev.nvim',
    event = "VeryLazy",
    opts = {}
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  { dir = "~/practice/noonx" },
  { dir = "~/Dev/playground/noonx" },
  -- init.lua
  {
    'darksinge/plink.nvim',
    event = "VeryLazy",

    -- commit = '4e62e47',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'darksinge/neodash.nvim',
      'MunifTanjim/nui.nvim',
    },
  },
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  { import = 'custom.plugins' },
}
