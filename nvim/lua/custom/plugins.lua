return {
  {
    "folke/which-key.nvim",
    config = function ()
      require("which-key").setup({})
    end
  },

  { "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {}
  end,
  }
}
