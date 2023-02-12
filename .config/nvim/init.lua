require("mowa")

vim.cmd.colorscheme('everforest')
vim.cmd [[
    function! s:init_fern() abort
      " Define NERDTree like mappings
      nmap <buffer> dd <Plug>(fern-action-cd)
endfunction
]]
