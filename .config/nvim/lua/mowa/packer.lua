-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-repeat'

  -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'sainnhe/everforest'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'xiyaowong/transparent.nvim'

  -- repl
  use 'pappasam/nvim-repl'

  -- util
  use "folke/trouble.nvim"
  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'simeji/winresizer'
  use 'zbirenbaum/copilot.lua'
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Git
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'
  use 'airblade/vim-gitgutter'


  -- lsp
  use 'neovim/nvim-lspconfig' -- Required
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "jay-babu/mason-null-ls.nvim"
  use { "ray-x/lsp_signature.nvim", }
  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })

  -- test
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  use('nvim-neotest/neotest-python')

  -- dap
  use('rcarriga/nvim-dap-ui')
  use('mfussenegger/nvim-dap-python')
  use('mfussenegger/nvim-dap')

  -- filer
  use('lambdalisue/fern.vim')
  use('lambdalisue/fern-hijack.vim')
  use('lambdalisue/fern-bookmark.vim')
  use('lambdalisue/fern-git-status.vim')
  use('LumaKernel/fern-mapping-fzf.vim')
  use('junegunn/fzf.vim')
  use('junegunn/fzf')

  -- obsidian
  use 'epwalsh/obsidian.nvim'

  -- latex
  use 'lervag/vimtex'


  -- snips
  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})use('saadparwaiz1/cmp_luasnip')

  use {
  "iurimateus/luasnip-latex-snippets.nvim",
  -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
  -- using treesitter.
  requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
  config = function()
    require'luasnip-latex-snippets'.setup({ use_treesitter = true })
    -- or setup({ use_treesitter = true })
  end,
  -- treesitter is required for markdown
  ft = { "tex", "markdown" },
}

end)
