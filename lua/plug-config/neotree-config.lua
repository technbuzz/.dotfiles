require("neo-tree").setup({
  default_component_configs = {

    git_status = {
      added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
      modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
      deleted   = "✖", -- this can only be used in the git_status source
      renamed   = "", -- this can only be used in the git_status source
      -- Status type
      untracked = "",
      ignored   = "",
      unstaged  = "",
      staged    = "",
      conflict  = "",
    },
  },

  window = {
    mappings = {
      ["o"] = "open"
    }
  },
  filesystem = {
    follow_current_file = true
  }
})

-- keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<C-b>", ":NeoTreeRevealToggle<cr>")
vim.keymap.set("n", "<leader>n", ":NeoTreeFocus<cr>")
