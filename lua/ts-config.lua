
local opt = vim.opt

require 'nvim-treesitter.install'.compilers = {"zig"}
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help","html", "javascript", "typescript", "css" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {enable = true},
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  },

textobjects = {
    move = {
      enable = true,
      set_jumps = true,

      goto_next_start = {
        ["]p"] = "@parameter.inner",
        -- ["]m"] = "@function.outer",
        -- ["]]"] = "@class.outer",
      },
      -- goto_next_end = {
      --   ["]M"] = "@function.outer",
      --   ["]["] = "@class.outer",
      -- },
      -- goto_previous_start = {
      --   ["[p"] = "@parameter.inner",
      --   ["[m"] = "@function.outer",
      --   ["[["] = "@class.outer",
      -- },
      -- goto_previous_end = {
      --   ["[M"] = "@function.outer",
      --   ["[]"] = "@class.outer",
      -- },
    },
  }
}



opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

