return {
  {
    "nvim-treesitter/nvim-treesitter", -- optional
  },
  {
    "kylechui/nvim-surround",
    lazy = true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "pappasam/nvim-repl",
    config = function()
      vim.g["repl_filetype_commands"] = {
        ["javascript"] = "node",
        ["python"] = "ipython --no-autoindent",
      }
      vim.keymap.set("n", "<leader>l", "<cmd>ReplToggle<CR>")
      vim.keymap.set("n", "<leader>rr", [[<Plug>ReplSendLine]])
      vim.keymap.set("v", "<leader>rr", [[<Plug>ReplSendVisual]])
    end,
  },
  {
    "simeji/winresizer",
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        -- config
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },
}
