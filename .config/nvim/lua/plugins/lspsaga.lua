return {
  {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
        vim.keymap.set("n","gd","<cmd>Lspsaga goto_definition<cr>",{noremap = true, silent = true})
        vim.keymap.set("n","gp","<cmd>Lspsaga peek_definition<cr>",{noremap = true, silent = true})
        vim.keymap.set("n","K","<cmd>Lspsaga hover_doc<cr>",{noremap = true, silent = true})
        vim.keymap.set("n","<leader>rn","<cmd>Lspsaga rename<cr>",{noremap = true, silent = true})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    }
  }
}
