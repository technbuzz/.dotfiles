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
        ['np'] = 'format_file',
        ['ny'] = 'yank_files',
        ['nt'] = 'search_by_dir',
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
      end,
      format_file = function(state)
        local node = state.tree:get_node()
        local id = node:get_id()
        vim.api.nvim_input(":!prettier " .. id .. " --write <End>")
      end,

      yank_files = function(state)
        local node = state.tree:get_node()
        local id = node:get_id()
        vim.api.nvim_input(":!cp -R " .. id .. "<End>" )
      end,

      search_by_dir = function(state)
        local node = state.tree:get_node()
        local id = node:get_id()
        vim.api.nvim_command("Telescope find_files search_dirs=".. id)
        P(id)
        P("Telescope find_files search_dirs=".. id)
      end
    }
  }
})

-- keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<C-b>", ":NeoTreeRevealToggle<cr>")
vim.keymap.set("n", "<leader>n", ":NeoTreeFocus<cr>")
