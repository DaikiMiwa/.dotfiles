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

      local get_python_path = function()
        local virtual_env_path = vim.trim(vim.fn.system("poetry config virtualenvs.path"))
        local virtual_env_dirctory = vim.trim(vim.fn.system("poetry env list"))
        local virtual_env_dirctory_split = split(virtual_env_dirctory, " ")[1]
        local python_path = string.format("%s/%s/bin/python", virtual_env_path, virtual_env_dirctory_split)
        return python_path
      end

      local get_venv_path = function ()
        local venv = os.getenv("VIRTUAL_ENV")
        local command = string.format("%s/bin/python", venv)
        return command
      end

      -- local python_path = 'python'
      -- -- 現在のディレクトリに対応するvirtualenvがあるかのチェック
      -- if vim.split(virtual_env_dirctory, '\n') == 1 then
      --   python_path = string.format("%s/%s/bin/python", virtual_env_path, virtual_env_dirctory)
      --   print(python_path)
      -- end

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
          require("lspconfig")[server_name].setup({})
          require("lspconfig").pyright.setup({
            pythonPath = get_venv_path(),
            settings = {
              python = {
                -- venvPath = get_venv_path(),
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
          -- require('lspconfig').pylyzer.setup{
          --   root_dir = require("lspconfig/util").root_pattern(".venv"),
          --   settings = {
          --   }
          -- }
        end,
      })
    end,
  },
  {
    "creativenull/efmls-configs-nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      -- Register linters and formatters per language
      local eslint = require("efmls-configs.linters.eslint")
      local prettier = require("efmls-configs.formatters.prettier")
      local stylua = require("efmls-configs.formatters.stylua")
      local mypy = require("efmls-configs.linters.mypy")
      local black = require("efmls-configs.formatters.black")
      local isort = require("efmls-configs.formatters.isort")
      local languages = {
        typescript = { eslint, prettier },
        lua = { stylua },
        python = {mypy, black, isort}
      }
      local efmls_config = {
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { ".git/" },
          languages = languages,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }

      require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
        -- Pass your custom lsp config below like on_attach and capabilities
        --
        -- on_attach = on_attach,
        -- capabilities = capabilities,
      }))
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
