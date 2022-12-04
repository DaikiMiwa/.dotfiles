call plug#begin()
    " 基本中の基本
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'simeji/winresizer'
    Plug 'mattesgroeger/vim-bookmarks'
    Plug 'ericbn/vim-solarized'

    " 統合開発環境化する
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'mattn/vim-lsp-icons'

    " スニペット
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    " tex
    " Plug 'lervag/vimtex', {'tag': 'v1.6'}
    " Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

    " ファイラー
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-bookmark.vim'
    Plug 'lambdalisue/fern-git-status.vim'

    " for python 
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

    Plug 'lervag/vimtex'
call plug#end()

syntax enable

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
imap <c-@> <Plug>(asyncomplete_force_refresh)

" LSP用の設定
" errorの内容をファイルに表示する
nmap <buffer> K <plug>(lsp-hover)
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_settings_filetype_python = 'jedi-language-server'
"let g:lsp_settings_filetype_python = ['pylsp-all']

"let g:lsp_settings = {
"    \'jedi-language-server':
"        \{ 
"        \   'diagnostics': { 'enable' : 1, }, 
"    \}, 
"\}

let g:lsp_settings = { 
        \'pylsp': 
            \{ 'workspace_config': 
                \{ 'pylsp': { 
                    \'configurationSources': ['flake8'], 
                    \'plugins': { 
                        \'jedi_completion' : { 
                            \'include_function_objects' : 1},
                            \'include_class_objects' : 1} 
                            \},
                        \'flake8': { 'enabled': 1 }, 
                        \'mccabe': { 'enabled': 0 }, 
                        \'pycodestyle': { 'enabled': 0 }, 
                        \'pyflakes': { 'enabled': 0 }, 
                        \'pylsp-mypy' : { 'enabled':1 } } } } 

" vimlatexの設定
" pdf latex を使うときは下のやつはコメントアウトする
"let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
let g:tex_flavor = "latex"
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
filetype plugin indent on

"Fern用の設定
" 隠しファイルを表示する
let g:fern#default_hidden=1

"docstring生成のキーバインド
"ctrl + k で生成
nmap <silent> <C-k> <Plug>(pydocstring)
autocmd FileType python setlocal tabstop=4 shiftwidth=4 smarttab expandtab
let g:pydocstring_formatter = 'google'

"vim-snip"
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

"ほかん
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ asyncomplete#force_refresh()

"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

let g:asyncomplete_auto_completeopt=0
set completeopt=menu,noinsert

set laststatus=2
set noshowmode
let g:lightline = {
\  'enable': { 'tabline': 0 },
\  'colorscheme': 'wombat',
\  'active': {
\    'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified'] ],
\    'right': [ ['percent'], ['fileencording'] ]
\  },
\  'inactive': {
\    'left': [ ['filename'] ],
\    'right': [ ['percent'], ['fileencording'] ]
\  },
\  'separator': { 'left': "", 'right': "" },
\  'subseparator' :{ 'left': '|', 'right': '|' }
\}

syntax enable
set background=dark
colorscheme solarized

set conceallevel=2
let g:tex_conceal="abdgm"
