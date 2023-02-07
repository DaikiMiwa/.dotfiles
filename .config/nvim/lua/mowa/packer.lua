-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }
    use("jose-elias-alvarez/null-ls.nvim")
    use("jay-babu/mason-null-ls.nvim")
    use { 'neovim/nvim-lspconfig' } -- Required
    use { 'ray-x/lsp_signature.nvim' }
    use { 'hrsh7th/nvim-cmp' } -- Required
    use { 'hrsh7th/cmp-nvim-lsp' } -- Required
    use { 'hrsh7th/cmp-buffer' } -- Optional
    use { 'hrsh7th/cmp-path' } -- Optional
    use { 'hrsh7th/vim-vsnip' } -- Optional
    use { 'hrsh7th/cmp-vsnip' } -- Optional
    use { 'onsails/lspkind.nvim' }

    -- use{'neoclide/coc.nvim', branch='release'}
    use('tpope/vim-surround')
    use('simeji/winresizer')
    use('lambdalisue/fern.vim')
    use('lambdalisue/fern-hijack.vim')
    use('nvim-neotest/neotest')
    use('nvim-neotest/neotest-python')
    use('mfussenegger/nvim-dap')
    use('rcarriga/nvim-dap-ui')
    use('mfussenegger/nvim-dap-python')
    use('lukas-reineke/lsp-format.nvim')
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use('sainnhe/everforest')
    use('RishabhRD/nvim-lsputils')
    use('RishabhRD/popfix')
    use('kdheepak/lazygit.nvim')
end)
