
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
null_ls.setup({
  debug = true,
  sources = {
    formatting.prettier.with({
      filetypes = { "html"}
    })
  }
})

-- null_ls.builtins.formatting.prettier.with({
--   filetypes = { "html" }, -- filetypes = { "html", "json", "yaml", "markdown" },
-- )
