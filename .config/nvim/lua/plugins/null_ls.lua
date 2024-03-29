return {
  {
    "nvimtools/none-ls.nvim",
    config = function ()
      require("null-ls").setup({ })
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "henrywallace/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        automatic_setup = true,
        handlers = {}
      })
    end,
  }
}

