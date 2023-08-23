return {
  { 'lewis6991/gitsigns.nvim' },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    key = {
      {"<leader>gg", "<cmd>LazyGit<cr>"},
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
