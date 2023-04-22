call plug#begin()

    Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

    Plug 'sainnhe/everforest'
    Plug 'tomasr/molokai'
    Plug 'tpope/vim-surround'

    Plug 'lervag/vimtex'

    let g:vimtex_compiler_method = 'latexmk'
    let g:vimtex_compiler_latexmk = {
                \ 'background': 1,
                \ 'build_dir': '',
                \ 'continuous': 1,
                \'options' : []
                \}
    let g:vimtex_compiler_latexmk_engines = {"_" : "-uplatex"}
    let g:vimtex_quickfix_mode=0
    let g:tex_flavor='latex' 
    let g:vimtex_view_method = 'skim' 
    let g:vimtex_view_skim_sync = 1 
    let g:vimtex_view_skim_activate = 1 

    Plug 'KeitaNakamura/tex-conceal.vim'
        set conceallevel=1
        let g:tex_conceal='abdmg'
        hi Conceal ctermbg=none
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'

    setlocal spell
    set spelllang=en_us
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

     " ファイラー
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-bookmark.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'tpope/vim-surround'

call plug#end()

syntax enable

" 基本入力設定
set tabstop=4
set shiftwidth=4
set expandtab
let localmapleader = "\\"
let mapleader = "\<Space>"
let g:vim_markdown_math = 1

autocmd BufWritePre \*.tex :call FixPunctuation()
function! FixPunctuation() abort
  let l:pos = getpos('.')
  silent! execute ':%s/。/. /g'
  silent! execute ':%s/、/, /g'
  silent! execute ':%s/\\\@<!\s\+$//'
  call setpos('.', l:pos)
endfunction

augroup IME
  autocmd!
  autocmd CmdlineLeave /,? :call system(
    \ 'osascript -e "tell application \"System Events\" to key code 102"'
    \ )
augroup END

nnoremap <Leader>e :Fern . -drawer -toggle -reveal=%<CR>

set background=dark
colorscheme gruvbox
