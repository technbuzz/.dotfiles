local ls = require("luasnip");

-- require("luasnip.loaders.from_lua").load({paths = "~/AppData/Local/nvim/LuaSnip/"})
require("luasnip.loaders.from_lua").load({paths = "./LuaSnip/"})
require("luasnip.loaders.from_vscode").lazy_load({paths = "./LuaSnip/angular"})


-- require("luasnip.loaders.from_lua").load({paths = "~/snippets"})
ls.config.set_config({
   -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",

})
