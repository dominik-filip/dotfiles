" leader
let mapleader=","
let g:mapleader=","

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" theme
Plugin 'nanotech/jellybeans.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'bling/vim-airline'
  let g:airline_symbols={}
  let g:airline#extensions#tabline#enabled=1
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline#extensions#whitespace#enabled=0
  let g:airline_symbols.linenr=''

" navigation
Plugin 'tpope/vim-vinegar'
Plugin 'justinmk/vim-sneak'
  let g:sneak#streak=1
Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_clear_cache_on_exit=0
  let g:ctrlp_max_height=40
  let g:ctrlp_max_files=10000
  let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
  let g:ctrlp_reuse_window='startify'
  let g:ctrlp_extensions=['tag', 'line']
  let g:ctrlp_custom_ignore={
        \ 'dir': '\v[\/]\.(git|hg)$|vendor/|tmp/',
        \ 'file': '\v\.DS_Store$',
        \ }
  let g:ctrlp_map='<c-p>'
  let g:ctrlp_cmd='CtrlP'
  let g:ctrlp_working_path_mode='ra'
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("h")': ['<c-h>'],
        \ 'PrtCurLeft()':         ['<c-x>'],
        \ }
  let g:ctrlp_open_new_file = 't'
  nnoremap <silent> <leader>p :CtrlP<cr>
  nnoremap <silent> <leader>t :CtrlPTag<cr>
  nnoremap <silent> <leader>l :CtrlPLine<cr>

" complete
Plugin 'Valloric/YouCompleteMe'
  let g:ycm_complete_in_comments_and_strings=1
  let g:ycm_key_list_select_completion=[]
  let g:ycm_key_list_previous_completion=[]
Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  let g:UltiSnipsEditSplit="horizontal"
  nmap <leader>u :UltiSnipsEdit<cr>
Plugin 'honza/vim-snippets'

" edit
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular'
Plugin 'mhinz/vim-startify'
  nnoremap <F1> :Startify<cr>
  map <leader>s :SSave<cr>
  let g:startify_session_dir='~/.vim/.cache/sessions'
  let g:startify_show_sessions=1
  let g:startify_change_to_vcs_root=1
Plugin 'scrooloose/syntastic'
  let g:syntastic_error_symbol='✗'
  let g:syntastic_style_error_symbol='✠'
  let g:syntastic_warning_symbol='∆'
  let g:syntastic_style_warning_symbol='≈'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'airblade/vim-gitgutter'
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
  nmap <leader>hn <plug>GitGutterNextHunk
  nmap <leader>hp <plug>GitGutterPrevHunk
  nmap <leader>hv <plug>GitGutterPreviewHunk
  nmap <leader>hs <plug>GitGutterStageHunk
  nmap <leader>hu <plug>GitGutterRevertHunk

" Ruby/Rails
Plugin 'tpope/vim-rails'
  map <leader>m :Rmodel 
  map <leader>v :Rview 
  map <leader>c :Rcontroller 
  map <leader>r :Rmigration

" misc
Plugin 'KabbAmine/zeavim.vim'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
  map <leader>cc :CoffeeCompile<cr>
  vmap <leader>cc :CoffeeCompile<cr>
  map <leader>cw :CoffeeWatch<cr>
  map <leader>cr :CoffeeRun<cr>
  let g:coffee_compile_vert = 1
  let g:coffee_watch_vert = 1
Plugin 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'underscore,backbone,jquery,handlebars'

" test
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/closetag.vim'

call vundle#end()
filetype plugin indent on
syntax on
colorscheme jellybeans

" mouse, format
set mouse=a
set mousehide
set history=500
set ttyfast
set encoding=utf-8
set hidden
set autoread
set fileformats+=mac
set nrformats-=octal
set showcmd
set noshelltemp

" whitespace, indentation
set backspace=indent,eol,start
set autoindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set shiftround
set linebreak
let &showbreak='↪ '

" search scroll
set scrolloff=1
set scrolljump=5

" autocomplete
set wildmenu
set wildmode=list:full
set wildignorecase

" window default behavior
set splitbelow
set splitright

" error, bell
set noerrorbells
set novisualbell
set t_vb=

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" ui configuration
set showmatch
set matchtime=2
set number
set lazyredraw
set laststatus=2
set noshowmode
set foldenable
set foldmethod=syntax
set foldlevelstart=99
set cursorline
set noswapfile
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline
let &colorcolumn=80

set timeoutlen=300
set ttimeoutlen=20

set clipboard=unnamedplus

" basics
nnoremap <leader>w :w<cr>
nnoremap <leader><leader> :w<cr>
nnoremap <leader><space> :q!<cr>
nnoremap <leader><leader><space> :wqa!<cr>

" escape magic
inoremap <leader>. <esc>
vnoremap <leader>. <esc>
" Ctrl-c

" too slow?
inoremap ;; <esc>
vnoremap ;; <esc>

" SudoWrite
nnoremap <leader>sw :w !sudo tee > /dev/null %<cr>

" buffers
noremap <tab> :bn<cr>
noremap <s-tab> :bp<cr>

" wrapped lines sanity
nnoremap <silent> j gj
nnoremap <silent> k gk

" auto center search
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
nnoremap<s-h> gT
nnoremap<s-l> gt

" windows
nnoremap <leader>wh :split<cr>
nnoremap <leader>wv :vsplit<cr>
" these three made more sense when caps_lock wasn't mapped to ctrl
nnoremap <leader>wo <c-w><c-o>
nnoremap <leader>wt <c-w>T
nnoremap <leader>ww <c-w>w
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Y consistent with C and D
nnoremap Y y$

" highlight
nnoremap <bs> :set hlsearch! hlsearch?<cr>

" blasphemy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" wordwise Ctrl-Y in insert mode
inoremap <expr> <c-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" split lines
nnoremap K i<cr><esc>k$

" Ctags
nnoremap <F3> :!ctags -R --exclude=.git --exclude=log --exclude=vendor *<cr>

" accuracy adjustment
cnoreabbrev W w

" rofl
map <F2> ggg?G``
