local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 'neovim/nvim-lspconfig'
  -- NOTE: This is where your plugins related to LSP can be installed.


  { -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  { 'nvim-lualine/lualine.nvim', opts = {} },


  { 'akinsho/toggleterm.nvim', version = '*' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {  'nvim-lua/plenary.nvim' },
    opts = {menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }},
    config = function() 
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    end,
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,

  },

  { 'mattn/emmet-vim' },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
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
  -- Plug 'tpope/vim-surround'
  { 'wakatime/vim-wakatime' },
  -- Plug '~/desktop/practice/deleteme/nvim-plugins/ngutils.nvim'
  -- Dev Tools
  -- Not working properly
  -- {
  --     'Equilibris/nx.nvim',
  --     dependencies = 'nvim-telescope/telescope.nvim' ,
  --     opts = {}
  -- },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  require 'smk.plugins.cmp',
  require 'smk.plugins.lsp',
  require 'smk.plugins.treesitter',
  require 'smk.plugins.telescope',
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
})
