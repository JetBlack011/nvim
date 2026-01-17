return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,       -- load immediately
  priority = 1000,    -- early load
  config = function()
    require("nvim-treesitter").setup {
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
