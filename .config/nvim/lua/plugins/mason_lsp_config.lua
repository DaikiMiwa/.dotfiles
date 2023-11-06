return {
  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },

    config = function()
      local mason = require("mason")
      local split = function(str, ts)
        -- 引数がないときは空tableを返す
        if ts == nil then
          return {}
        end

        local t = {}
        i = 1
        for s in string.gmatch(str, "([^" .. ts .. "]+)") do
          t[i] = s
          i = i + 1
        end

        return t
      end

      local get_venv_path = function ()
        local venv = os.getenv("VIRTUAL_ENV")
        local command = string.format("%s/bin/python", venv)
        return command
      end

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
          require("lspconfig")[server_name].setup({capabilities=lsp_capabilities})
          require("lspconfig").pyright.setup({
            pythonPath = get_venv_path(),
            settings = {
              python = {
                pythonPath = get_venv_path(),
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = true,
                  typeCheckingMode = "basic",
                },
              },
            },
          })
        end,
      })
    end,
  },
  {
     "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
      },
      config = function () 
        vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
        vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
        vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
        vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
        vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
      end
  }
}
