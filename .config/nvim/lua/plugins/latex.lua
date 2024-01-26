return {
  "lervag/vimtex",
  config = function ()
    vim.cmd [[
      let g:vimtex_syntax_enabled = 0
      let g:vimtex_view_general_viewer  = 'zathura'
    ]]
  end
}
