return {
    { "telescope.nvim", cmd = "Telescope" },
    { "toggleterm.nvim" },
    {
      "luasnip",
      event = "InsertEnter"
    },
    { "friendly-snippets" },
    {
      "nvim-autopairs",
      event = "InsertEnter",
      after = function()
          require("nvim-autopairs").setup {}
      end
    },
    { "yazi.nvim", cmd = "Yazi" },
    {
      "nvim-surround",
      event = "DeferredUIEnter",
      after = function()
          require("nvim-surround").setup({})
      end
    }
}

