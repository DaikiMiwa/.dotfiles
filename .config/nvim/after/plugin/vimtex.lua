vim.cmd[[let g:tex_flavor = "latex"]]
vim.cmd[[let g:vimtex_compiler_method = 'latexmk']]
vim.cmd[[let g:vimtex_view_general_viewer = 'zathura']]
vim.cmd[[let g:vimtex_view_general_options = "-x \"nvr +%{line} %{input}\" --synctex-forward @line:0:@tex @pdf"]]
