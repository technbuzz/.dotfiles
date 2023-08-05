-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

local opts = { noremap = true, silent = true }
local api = vim.api

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeFocus<cr>", opts)
