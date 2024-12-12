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
    },
    {
      "lazygit.nvim",
       keys = {
           { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
       },
       after = function()
           require("lazygit")
       end
    },
    { "vimplugin-ansible-doc.nvim" },
--     {
--       "nvim-treesitter",
--       event = "BufRead",
--       after = function ()
--         require("vimplugin-treesitter-grammar-groovy")
--         require("nvim-treesitter.configs").setup {
--           highlight = {
--             enable = true,
--           },
--           indent = {
--             enable = true,
--           },
--           textobjects = {
--             select = {
--               enable = true,
--               lookahead = true,
--               keymaps = {
--                 ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
--                 ["aa"] = { query = "@parameter.outer", desc = "around argument" },
--               },
--             },
--           },
--         }
--       end
--     }
}
