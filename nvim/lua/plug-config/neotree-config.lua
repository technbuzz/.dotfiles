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
    follow_current_file = true,
    window = {
      mappings = {
        ['nf'] = 'touch_files',
      }
    },
    commands = {
      touch_files = function(state)
        local node = state.tree:get_node()
        local id = node:get_id()
        vim.api.nvim_input(":!touch " .. id .. "<Home>")
        -- P(node)
        -- copy string to clipboard using neovim api
        -- vim.fn.setreg('+', id)
        -- vim.fn.setreg('"', id)
        -- P('path copied to clipboard')
      end

    }
  }
})

-- keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<C-b>", ":NeoTreeRevealToggle<cr>")
vim.keymap.set("n", "<leader>n", ":NeoTreeFocus<cr>")
