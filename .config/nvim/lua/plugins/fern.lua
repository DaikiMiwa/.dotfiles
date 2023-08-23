return {
  {
    "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/nerdfont.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "yuki-yano/fern-preview.vim",
      "lambdalisue/fern-hijack.vim",
      "lambdalisue/fern-git-status.vim"
    },
    config = function()
      vim.cmd [[
    function! s:fern_settings() abort
      nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
      nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
      nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
      nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
    endfunction
    augroup fern-settings
      autocmd!
      autocmd FileType fern call s:fern_settings()
    augroup END
    ]]
      vim.g['fern#renderer'] = 'nerdfont'
      vim.g['fern#renderer#nerdfont#indent_markers'] = 1
      vim.keymap.set("n", "<leader>e", "<cmd>Fern . -toggle -drawer -width=40<CR>")
      -- vim.keymap.set("n", "<leader>f", "<cmd>Fern . -reveal=% -drawer -toggle -width=40<CR>")
      --vim.keymap.set("n", "<leader>e", "", {
      --callback = function()
      --  if vim.bo.filetype == "fern" then
      --    vim.cmd.wincmd "p"
      --  else
      --    vim.cmd.Fern(".", "-reveal=%", "-drawer", "-width=40")
      --  end
      --end,
      --noremap = true,
      --silent = true,
      --})
    end
  }
}
