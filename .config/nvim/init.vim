call plug#begin('~/.local/share/nvim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'lifepillar/vim-solarized8'
	Plug 'shaunsingh/solarized.nvim'
	Plug 'itchyny/lightline.vim'
    Plug 'simeji/winresizer'
    Plug 'tpope/vim-surround'
    Plug 'itchyny/vim-gitbranch'
    Plug 'tpope/vim-fugitive'

    " snippets
    Plug 'SirVer/ultisnips'

    " tex
    Plug 'lervag/vimtex', {'tag': 'v1.6'}
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    
    " ファイラー
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'simrat39/symbols-outline.nvim'
    Plug 'liuchengxu/vista.vim'
    Plug 'overcache/NeoSolarized'
call plug#end()
let g:python3_host_prog = expand('~/.venv/neovim3/bin/python')

" This code should go in your vimrc or init.vim
let g:UltiSnipsExpandTrigger       = '<c-j>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<c-l>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips']

" 基本入力設定
set tabstop=4
set shiftwidth=4
set expandtab
let localmapleader = "\\"
let mapleader = "\<Space>"
colorscheme hybrid

" 基本表示設定
set number

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

" fzfの設定
nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.CocOutline<CR>

" setting for python formating
function! PythonFormat() abort
    call CocActionAsync('format')
    call coc#rpc#notify('runCommand', ['python.sortImports'])
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"xmap <leader>a  <Plug>(coc-format-selected)
nmap <localleader>b  <Plug>(coc-format) 
nmap <localleader>f :<C-u>CocCommand python.sortImports<CR> 
nmap <localleader>o :<C-u>CocCommand pyright.organizeimports<CR> 

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
let g:tex_flavor = "latex"
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = "-x \"nvr +%{line} %{input}\" --synctex-forward @line:0:@tex @pdf"
filetype plugin indent on

set conceallevel=2
let g:tex_conceal="adgmb"


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
"
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

colorscheme NeoSolarized
set termguicolors

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
  "python",
    "scss",
    "latex"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
EOF
