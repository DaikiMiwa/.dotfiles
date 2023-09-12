return {
  {
    "nvim-neotest/neotest",
    dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    }
  },
  {
    "nvim-neotest/neotest-python",
    config = function ()
      require("neotest").setup({
        adapters = {
          require("neotest-python")
        }
      })
      vim.api.nvim_set_keymap('n', '<leader>t', ':lua require("neotest").summary.toggle()<CR>', {})
    end
  }
}
