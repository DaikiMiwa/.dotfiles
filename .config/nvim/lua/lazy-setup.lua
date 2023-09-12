local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local load_plugins = {
  require 'plugins.ddc',
  require 'plugins.fern',
  require 'plugins.lualine',
  require 'plugins.colorscheme',
  require 'plugins.mason_lsp_config',
  require 'plugins.telescope',
  require 'plugins.git',
  require 'plugins.lspsaga',
  require 'plugins.null_ls',
  require 'plugins.test'
}

local plugins = {
  {
    'nvim-treesitter/nvim-treesitter', -- optional
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    keys = {
      { 's', ':HopChar2MW<CR>' }
    },
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
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
    end
  },
  {
    'xiyaowong/transparent.nvim'
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'goerz/jupytext.vim',
    config = function ()
      vim.g["jupytext_fmt"] = 'py'
    end
  },
  {
    'lervag/vimtex',
    config = function ()
      vim.cmd[[let g:tex_flavor = "latex"]]
      vim.cmd[[let g:vimtex_compiler_method = 'latexmk']]
      vim.cmd[[let g:vimtex_view_general_viewer = 'zathura']]
      vim.cmd[[let g:vimtex_view_general_options = "-x \"nvr +%{line} %{input}\" --synctex-forward @line:0:@tex @pdf"]]
    end
  },
  {
    'pappasam/nvim-repl',
    config = function ()
      vim.g["repl_filetype_commands"] = {
        ['javascript'] = 'node',
        ['python'] = 'ipython --no-autoindent'
      }
      vim.keymap.set("n","<leader>l", "<cmd>ReplToggle<CR>")
      vim.keymap.set("n","<leader>rr", [[<Plug>ReplSendLine]])
      vim.keymap.set("v","<leader>rr", [[<Plug>ReplSendVisual]])
    end
  },
  {
    'simeji/winresizer'
  }
}

for _, t in pairs(load_plugins) do
  for _, p in pairs(t) do
    table.insert(plugins, p)
  end
end

require('lazy').setup(plugins, { checker = { enable = true, frequency = 1 } })

require('lspsaga').setup()
