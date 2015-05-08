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
Plugin 'bling/vim-airline'
  if !exists('g:airline_symbols')
    let g:airline_symbols={}
  endif

  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#left_sep=' '
  let g:airline#extensions#tabline#left_alt_sep='|'
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline#extensions#whitespace#enabled=0
  let g:airline_symbols.linenr=''

" navigation
Plugin 'tpope/vim-vinegar'
Plugin 'justinmk/vim-sneak'
  let g:sneak#streak=1
Plugin 'kien/ctrlp.vim'
  let g:ctrlp_clear_cache_on_exit=1
  let g:ctrlp_max_height=40
  let g:ctrlp_max_files=10000
  let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
  let g:ctrlp_reuse_window='startify'
  let g:ctrlp_extensions=['tag']
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

" complete
Plugin 'Valloric/YouCompleteMe'
  let g:ycm_complete_in_comments_and_strings=1
  let g:ycm_key_list_select_completion=['<C-n>']
  let g:ycm_key_list_previous_completion=['<C-p']
  let g:ycm_filetype_blacklist={'unite': 1, 'markdown' : 1}
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  let g:UltiSnipsSnippetsDir='~/.vim/snippets'

" edit
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular'
Plugin 'mhinz/vim-startify'
  nnoremap <F1> :Startify<CR>
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
Plugin 'mhinz/vim-signify'
  nmap <leader>hn <plug>(signify-next-hunk)
  nmap <leader>hp <plug>(signify-prev-hunk)

" Ruby/Rails test
Plugin 'tpope/vim-rails'
  map <leader>m :Rmodel 
  map <leader>v :Rview 
  map <leader>c :Rcontroller 
  map <leader>r :R

" misc
Plugin 'KabbAmine/zeavim.vim'
Plugin 'othree/html5.vim'

" test
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
  map <leader>cc :CoffeeCompile<cr>
  vmap <leader>cc <esc>:CofeeCompile<cr>
  map <leader>cw :CoffeeWatch<cr>
  map <leader>cr :CoffeeRun<cr>
  let g:coffee_compile_vert = 1
  let g:coffee_watch_vert = 1
Plugin 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'underscore,backbone,jquery'

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

" basics
nnoremap <leader>w :w<cr>
nnoremap <leader><leader> :w<cr>
nnoremap <leader><Esc> :q!<CR>
nnoremap <leader><leader><Esc> :wqa!<CR>

" SudoWrite
nnoremap <leader>sw :w !sudo tee > /dev/null %<cr>

" buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :bd<CR>
nmap <leader>D :bufdo bd<CR>

" arrow keys
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <up> :tabnext<CR>
nnoremap <down> :tabprev<CR>

" sane regex
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v

" cmd window
nnoremap q: q:i
nnoremap q/ q/i
nnoremap q? q?i

" wrapped lines sanity
nnoremap <silent> j gj
nnoremap <silent> k gk

" auto center search
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" tabs
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
nnoremap<S-h> gT
nnoremap<S-l> gt

" windows
nnoremap <leader>h :split<CR>

" Y consistent with C and D
nnoremap Y y$

" highlight
nnoremap <BS> :set hlsearch! hlsearch?<CR>

" blasphemy
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A

" visual steroids
nnoremap gV `[v`]

" dvorak
nnoremap _ ^

" Wordwise Ctrl-Y in insert mode
inoremap <expr> <c-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" disable useless default
nnoremap K <nop>

" Ctags
nnoremap <F3> :!ctags -R --exclude=.git --exclude=log *<CR>

" accuracy adjustment
cnoreabbrev W w
