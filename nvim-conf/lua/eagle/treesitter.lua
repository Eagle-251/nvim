require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
        ["aa"] = { query = "@parameter.outer", desc = "around argument" },
      },
    },
  },
}
