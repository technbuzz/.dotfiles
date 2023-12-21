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
        ['nfz'] = 'fuzzy_search_by_dir',
      }
    },
    commands = {
      touch_files = function(state)
        local node = state.tree:get_node()
        -- get relative path from node not absolute path
        local path = node:get_id()
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
        vim.api.nvim_input(":!cp -R " .. id .. "<End>")
      end,

      search_by_dir = function(state)
        local node = state.tree:get_node()
        local id = node:get_id()
        -- Gives use relative path from CWD
        -- more options here https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370#discussioncomment-6372404
        local modifyPath = vim.fn.fnamemodify(id, ":.")
        -- P(id)
        require("telescope.builtin").find_files({
          search_dirs = { id },
          prompt_title = modifyPath,
        })
      end,

      fuzzy_search_by_dir = function(state)
        local node = state.tree:get_node()
        local id = node:get_id()
        local modifyPath = vim.fn.fnamemodify(id, ":.")
        require("telescope.builtin").live_grep({
          search_dirs = { id },
          prompt_title = modifyPath
        })
        P(id)
      end
    }
  }
})

-- keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<C-b>", ":NeoTreeRevealToggle<cr>")
vim.keymap.set("n", "<leader>n", ":NeoTreeFocus<cr>")
