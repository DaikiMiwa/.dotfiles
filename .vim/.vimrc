call plug#begin()
    " 基本中の基本
    Plug 'tpope/vim-surround'
    Plug 'simeji/winresizer'
    Plug 'mattesgroeger/vim-bookmarks'

    " 統合開発環境化する
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'mattn/vim-lsp-icons'

    " スニペット
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    " tex
    Plug 'lervag/vimtex'

    " ファイラー
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-bookmark.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'vim-autoformat/vim-autoformat'

    " for python 
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
call plug#end()

" 基本入力設定
set tabstop=4
set shiftwidth=4
set expandtab
let localmapleader = "\\"
let mapleader = "\<Space>"

" 基本表示設定
set number

" 補完用の設定達
" 自動的に補完が起動しないようにする
let g:asyncomplete_auto_popup = 1
" 補完はコントロールとスペースで起動する
imap <C-space> <Plug>(asyncomplete_force_refresh)

" LSP用の設定
" errorの内容をファイルに表示する
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_settings = { 'pylsp-all': { 'workspace_config': { 'pylsp': { 'configurationSources': ['flake8'], 'plugins': { 'flake8': { 'enabled': 1 }, 'mccabe': { 'enabled': 0 }, 'pycodestyle': { 'enabled': 0 }, 'pyflakes': { 'enabled': 0 }, 'pylsp-mypy' : {'enabled':1}} } } } }

" vimlatexの設定
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
let g:tex_flavor = "latex"
syntax enable
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

"Fern用の設定
" 隠しファイルを表示する
let g:fern#default_hidden=1

"docstring生成のキーバインド
"ctrl + k で生成
nmap <silent> <C-k> <Plug>(pydocstring)
autocmd FileType python setlocal tabstop=4 shiftwidth=4 smarttab expandtab
let g:pydocstring_formatter = 'google'
