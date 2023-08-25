return {
  {
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  lazy=true,
 keys = {
    -- lspで起動
    { "l", mode = "c", },
  },

  config = function()
    local mason = require('mason')

    local split = function(str, ts)
      -- 引数がないときは空tableを返す
      if ts == nil then return {} end

      local t = {} ;
      local i=1
      for s in string.gmatch(str, "([^"..ts.."]+)") do
        t[i] = s
        i = i + 1
      end

      return t
    end

    local get_python_path = function()
      local virtual_env_path = vim.trim(vim.fn.system('poetry config virtualenvs.path'))
      local virtual_env_dirctory = vim.trim(vim.fn.system('poetry env list'))
      local virtual_env_dirctory_split = split(virtual_env_dirctory, ' ')[1]
      local python_path = string.format("%s/%s/bin/python", virtual_env_path, virtual_env_dirctory_split)
      return python_path
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
          package_uninstalled = "✗"
        }
      }
    })

    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {}

        require('lspconfig').pyright.setup {
          root_dir = require("lspconfig/util").root_pattern(".venv"),
          settings = {
            python = {
              pythonPath = get_python_path(),
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'basic'
              },
            }
          }
        }
        -- require('lspconfig').pylyzer.setup{
        --   root_dir = require("lspconfig/util").root_pattern(".venv"),
        --   settings = {
        --   }
        -- }
      end,
    }
  end
  }
}
