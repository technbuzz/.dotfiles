return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    debug = true
  },
  config = function()

    local null_ls = require("null-ls")

    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html" },
      -- filetypes = { "html", "json", "yaml", "markdown" },
    })
  end
}
