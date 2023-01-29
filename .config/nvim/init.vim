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
    Plug 'bfredl/nvim-ipy'
    Plug 'goerz/jupytext.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'nvim-neotest/neotest'
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'nvim-neotest/neotest-python'
    Plug 'kiyoon/jupynium.nvim', { 'do': 'pip3 install --user .' }
    " Plug 'kiyoon/jupynium.nvim', { 'do': '~/miniconda3/envs/jupynium/bin/pip install .' }
    Plug 'rcarriga/nvim-notify'  " optional


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

" Fernで隠しフォルダを表示
let g:fern#default_hidden=1

" terminalに関する設定
" 新規タブでターミナルモードを起動
nnoremap <silent> tt <cmd>terminal<CR>
" 下分割でターミナルモードを起動
nnoremap <silent> tx <cmd>belowright new<CR><cmd>terminal<CR>

" ターミナルを開いたらに常にinsertモードに入る
autocmd TermOpen * :startinsert

" ターミナルモードで行番号を非表示
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

" vimのターミナルと同じ操作でペーストする
tnoremap <expr> <C-W> '<C-\><C-n>"'.nr2char(getchar()).'pi'

tnoremap <C-[> <C-\><C-n>
tnoremap <C-W>n       <cmd>new<cr>
tnoremap <C-W><C-N>   <cmd>new<cr>
tnoremap <C-W>q       <cmd>quit<cr>
tnoremap <C-W><C-Q>   <cmd>quit<cr>
tnoremap <C-W>c       <cmd>close<cr>
tnoremap <C-W>o       <cmd>only<cr>
tnoremap <C-W><C-O>   <cmd>only<cr>
tnoremap <C-W><Down>  <cmd>wincmd j<cr>
tnoremap <C-W><C-J>   <cmd>wincmd j<cr>
tnoremap <C-W>j       <cmd>wincmd j<cr>
tnoremap <C-W><Up>    <cmd>wincmd k<cr>
tnoremap <C-W><C-K>   <cmd>wincmd k<cr>
tnoremap <C-W>k       <cmd>wincmd k<cr>
tnoremap <C-W><Left>  <cmd>wincmd h<cr>
tnoremap <C-W><C-H>   <cmd>wincmd h<cr>
tnoremap <C-W><BS>    <cmd>wincmd h<cr>
tnoremap <C-W>h       <cmd>wincmd h<cr>
tnoremap <C-W><Right> <cmd>wincmd l<cr>
tnoremap <C-W><C-L>   <cmd>wincmd l<cr>
tnoremap <C-W>l       <cmd>wincmd l<cr>
tnoremap <C-W>w       <cmd>wincmd w<cr>
tnoremap <C-W><C-W>   <cmd>wincmd w<cr>
tnoremap <C-W>W       <cmd>wincmd W<cr>
tnoremap <C-W>t       <cmd>wincmd t<cr>
tnoremap <C-W><C-T>   <cmd>wincmd t<cr>
tnoremap <C-W>b       <cmd>wincmd b<cr>
tnoremap <C-W><C-B>   <cmd>wincmd b<cr>
tnoremap <C-W>p       <cmd>wincmd p<cr>
tnoremap <C-W><C-P>   <cmd>wincmd p<cr>
tnoremap <C-W>P       <cmd>wincmd P<cr>
tnoremap <C-W>r       <cmd>wincmd r<cr>
tnoremap <C-W><C-R>   <cmd>wincmd r<cr>
tnoremap <C-W>R       <cmd>wincmd R<cr>
tnoremap <C-W>x       <cmd>wincmd x<cr>
tnoremap <C-W><C-X>   <cmd>wincmd x<cr>
tnoremap <C-W>K       <cmd>wincmd K<cr>
tnoremap <C-W>J       <cmd>wincmd J<cr>
tnoremap <C-W>H       <cmd>wincmd H<cr>
tnoremap <C-W>L       <cmd>wincmd L<cr>
tnoremap <C-W>T       <cmd>wincmd T<cr>
tnoremap <C-W>=       <cmd>wincmd =<cr>
tnoremap <C-W>-       <cmd>wincmd -<cr>
tnoremap <C-W>+       <cmd>wincmd +<cr>
tnoremap <C-W>z       <cmd>pclose<cr>
tnoremap <C-W><C-Z>   <cmd>pclose<cr>

let g:python3_host_prog = expand('~/.venv/neovim3/bin/python')

" This code should go in your vimrc or init.vim
let g:UltiSnipsExpandTrigger       = '<c-j>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<c-l>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips']

set clipboard=unnamed

" Tabの設定
nmap <Leader>n :bnext<CR>
nmap <Leader>p :bprev<CR>
xmap <Leader>n :bnext<CR>
xmap <Leader>p :bprev<CR>

" 基本入力設定
set tabstop=4
set shiftwidth=4
set expandtab
let localmapleader = "\\"
let mapleader = "\<Space>"
colorscheme hybrid

" 基本表示設定
set number

" Cocの設定
let g:coc_node_path = '/Users/miwanodaiki/.nvm/versions/node/v16.19.0/bin/node'

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

nnoremap <silent> <Leader>r :JupyniumExecuteSelectedCells<CR>
nnoremap <silent> <Leader>s :JupyniumSaveIpynb<CR>
nnoremap <silent> <Leader>jt :JupyniumLoadFromIpynbTabAndStartSync <CR>
nnoremap <expr> <Leader>h <Cmd> echo(getchar())

" setting for python formating
function! PythonFormat() abort
    call CocActionAsync('format')
    call coc#rpc#notify('runCommand', ['python.sortImports'])
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

autocmd BufRead,BufNewFile *.tex TSBufDisable highlight
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

command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")

let g:ipy_celldef = '^##' " regex for cell start and end

nmap <silent> <leader>jqt :RunQtConsole<Enter>
nmap <silent> <leader>jk :IPython<Space>--existing<Space>--no-window<Enter>
nmap <silent> <leader>jc <Plug>(IPy-RunCell)
nmap <silent> <leader>ja <Plug>(IPy-RunAll)

let g:jupytext_enable = 1
let g:jupytext_fmt = "py"
let g:ipy_celldef = '#'

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
require('dap-python').setup(os.getenv("VIRTUAL_ENV") .. '/bin/python')
require("neotest").setup({
  adapters = {
    require("neotest-python")({
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = true },
        -- Command line arguments for runner
        -- Can also be a function to return dynamic values
        args = {"--log-level", "DEBUG"},
        -- Runner to use. Will use pytest if available by default.
        -- Can be a function to return dynamic value.
        runner = "pytest",
        -- Custom python path for the runner.
        -- Can be a string or a list of strings.
        -- Can also be a function to return dynamic value.
        -- If not provided, the path will be inferred by checking for 
        -- virtual envs in the local directory and for Pipenev/Poetry configs
        python = ".venv/bin/python"
        -- Returns if a given file path is a test file.
        -- NB: This function is called a lot so don't perform any heavy tasks within it.
    })
  }
})
vim.api.nvim_set_keymap('n', '<leader>s', ':lua require("neotest").summary.toggle()<CR>' , {})
vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', { silent = true ,noremap = true,})
vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})

require("dapui").setup({
  icons = { expanded = "", collapsed = "" },
  layouts = {
    {
      elements = {
        { id = "watches", size = 0.20 },
        { id = "stacks", size = 0.20 },
        { id = "breakpoints", size = 0.20 },
        { id = "scopes", size = 0.40 },
      },
      size = 64,
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.20,
      position = "bottom",
    },
  },
})

require("jupynium").setup({
  -- Conda users:
  -- python_host = "~/miniconda3/envs/jupynium/bin/python",
  python_host = vim.g.python3_host_prog or "python",

  default_notebook_URL = "localhost:8888",

  -- Write jupyter command but without "notebook"
  -- When you call :JupyniumStartAndAttachToServer and no notebook is open,
  -- then Jupynium will open the server for you using this command. (only when notebook_URL is localhost)
  jupyter_command = "jupyter",
  -- jupyter_command = "~/miniconda3/bin/jupyter",

  -- Used when notebook is launched by using jupyter_command.
  -- If nil or "", it will open at the git directory of the current buffer,
  -- but still navigate to the directory of the current buffer. (e.g. localhost:8888/tree/path/to/buffer)
  notebook_dir = nil,

  -- Used to remember the last session (password etc.).
  -- You may need to change the path.
  firefox_profiles_ini_path = vim.fn.isdirectory(vim.fn.expand "/Users/miwanodaiki/Library/Application Support/Firefox  ")
      and "/Users/miwanodaiki/Library/Application Support/Firefox/profiles.ini"
    or  "/Users/miwanodaiki/Library/Application Support/Firefox/profiles.ini",
  firefox_profile_name = nil, -- nil means the default profile

  -- Open the Jupynium server if it is not already running
  -- which means that it will open the Selenium browser when you open this file.
  -- Related command :JupyniumStartAndAttachToServer
  auto_start_server = {
    enable = true,
    file_pattern = { "*.ju.*" },
  },

  -- Attach current nvim to the Jupynium server
  -- Without this step, you can't use :JupyniumStartSync
  -- Related command :JupyniumAttachToServer
  auto_attach_to_server = {
    enable = true,
    file_pattern = { "*.ju.*", "*.md" },
  },

  -- Automatically open an Untitled.ipynb file on Notebook
  -- when you open a .ju.py file on nvim.
  -- Related command :JupyniumStartSync
  auto_start_sync = {
    enable = true,
    file_pattern = { "*.ju.*", "*.md" },
  },

  -- Automatically keep filename.ipynb copy of filename.ju.py
  -- by downloading from the Jupyter Notebook server.
  -- WARNING: this will overwrite the file without asking
  -- Related command :JupyniumDownloadIpynb
  auto_download_ipynb = true,

  -- Always scroll to the current cell.
  -- Related command :JupyniumScrollToCell
  autoscroll = {
    enable = true,
    mode = "always", -- "always" or "invisible"
    cell = {
      top_margin_percent = 20,
    },
  },

  scroll = {
    page = { step = 0.5 },
    cell = {
      top_margin_percent = 20,
    },
  },

  use_default_keybindings = true,
  textobjects = {
    use_default_keybindings = true,
  },

  -- Dim all cells except the current one
  -- Related command :JupyniumShortsightedToggle
  shortsighted = false,
})
EOF

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
