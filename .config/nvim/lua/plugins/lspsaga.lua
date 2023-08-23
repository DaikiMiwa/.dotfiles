return {
  {
    'nvimdev/lspsaga.nvim',
    keys = {
      {"K","<cmd>Lspsaga hover_doc<cr>"},
      {"<leader>o","<cmd>Lspsaga outline<cr>"},
      {"<leader>]","<cmd>Lspsaga diagnostic_jump_next<cr>"},
      {"<leader>[","<cmd>Lspsaga diagnostic_jump_prev<cr>"},
      {"<leader>d","<cmd>Lspsaga pead_definition<cr>"},
      {"<leader>c","<cmd>Lspsaga code_action<cr>"}
    },
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
    }
  }
}
