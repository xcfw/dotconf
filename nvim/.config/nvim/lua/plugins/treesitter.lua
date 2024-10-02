return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = "<CR>",
        node_decremental = "(",
      },
    },
  },
}
