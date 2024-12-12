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

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.smartindent = true

-- Don't acidentally run these
-- vim.api.nvim_del_user_command("TSUpdate")
-- vim.api.nvim_del_user_command("TSUpdateSync")
-- vim.api.nvim_del_user_command("TSInstall")
-- vim.api.nvim_del_user_command("TSInstallSync")
-- vim.api.nvim_del_user_command("TSInstallFromGrammar")
-- vim.api.nvim_del_user_command("TSUninstall")

-- require("nvim-ts-autotag").setup {}
--
-- require("mdx").setup {}
--
-- require("treesitter-context").setup {
--   enable = true,
--   max_lines = 4,
-- }
