if has('nvim')
    set inccommand=nosplit
else
    set nocompatible
    set t_Co=256
    filetype plugin indent on
    runtime! ftplugin/man.vim
endif

set history=10000
set encoding=utf-8
set fileformats=unix,dos
set shortmess+=I
set shortmess-=S
set laststatus=2
set noshowmode
set nu rnu
set scrolloff=10
set autoindent
set expandtab
set tabstop=4 shiftwidth=4
set smarttab
set ignorecase smartcase
set incsearch hlsearch
set autoread
set hidden
set splitbelow splitright
set wildmenu
set lazyredraw
set ttimeoutlen=0
set updatetime=50
set backspace=indent,eol,start
set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

" enable mouse in all modes (e.g. for easier selection)
if ! has('nvim') | set ttymouse=xterm2 | endif
set mouse=a

" return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" delete whitespace on save
autocmd BufWrite * exe "normal mz" | %s/\s\+$//ge | exe "normal `z"


""" KEY-BINDINGS
nnoremap <Space> <Nop>
let g:mapleader = " "
let g:maplocalleader = "\\"

set pastetoggle=<F1>

" toggle whitespace listing
noremap  <silent> <F3> :set list!<CR>
inoremap <silent> <F3> <C-o>:set list!<CR>
cnoremap <silent> <F3> <C-c>:set list!<CR>

" buffers
map <leader>bl :ls<CR>
map <leader>bd :bd<CR>
map <leader>bn :bnext<CR>
map <leader>bp :bprevious<CR>

" tabs
map <silent> <leader>tn :tabnew<CR>
map <silent> <leader>to :tabonly<CR>
map <silent> <leader>td :tabclose<CR>
map <silent> <leader>tm :tabmove<CR>
map <silent> <leader>t<leader> :tabnext<CR>
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" easier split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" spell checking
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sc z=

" separate configs for specific extensions
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.wppl setfiletype javascript


""" PLUGINS
if has('nvim')
    call plug#begin(stdpath('data') . '/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

""" Language-specific
"Plug 'lervag/vimtex', {'for': 'tex'} "{{{
"    let g:tex_flavor = 'latex'
""}}}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'idris-hackers/idris-vim', {'for': 'idris'}
Plug 'manicmaniac/coconut.vim', {'for': 'coconut'} "{{{
    autocmd FileType coconut setlocal commentstring=#\ %s
"}}}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-signify' "{{{
    map <silent> <leader>st :SignifyToggle<CR>
"}}}

Plug 'junegunn/vim-easy-align' "{{{
    xmap ga <Plug>(EasyAlign)
"}}}

Plug 'ojroques/vim-oscyank' "{{{
    " copy last yanked text to clipboard
    vmap <C-c> y:OSCYank<CR>
"}}}

Plug 'scrooloose/nerdtree' "{{{
    let NERDTreeShowHidden = 1
    map <silent> <F2> :NERDTreeToggle<CR>
"}}}

Plug 'sirver/UltiSnips' "{{{
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "{{{
    map <leader>f  :Files<CR>
    map <leader>bs :Buffers<CR>
"}}}

Plug 'deponian/vim-lightline-whitespace'
Plug 'itchyny/lightline.vim' "{{{
    let g:lightline = {
        \ 'colorscheme': 'nord',
        \ 'active': {
        \ 	'left': [ [ 'mode', 'paste', 'spell' ],
        \             [ 'readonly', 'filename', 'modified' ],
        \             [ 'gitinfo' ] ],
        \   'right': [ [ 'whitespace', 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype', 'fileformat' ] ],
        \ },
        \ 'component_function': {
        \   'gitinfo': 'FugitiveHead',
        \ },
        \ 'component_expand': {
        \   'whitespace': 'lightline#whitespace#check',
        \ },
        \ 'component_type': {
        \   'whitespace': 'warning',
        \ },
        \ 'mode_map': {
        \     'n' : 'N',
        \     'i' : 'I',
        \     'R' : 'R',
        \     'v' : 'V',
        \     'V' : 'VL',
        \     '': 'VB',
        \     'c' : 'C',
        \     's' : 'S',
        \     'S' : 'SL',
        \     '': 'SB',
        \     't': 'T',
        \   },
        \ }
"}}}

Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

" colorscheme
if &diff | syntax off | else | syntax enable | endif
set background=dark
colorscheme dim

hi Visual     ctermfg=7 ctermbg=8 cterm=none
hi MatchParen ctermfg=8 ctermbg=7 cterm=none
hi SpellBad   ctermfg=7 ctermbg=1 cterm=none
hi SpellCap   ctermfg=0 ctermbg=3 cterm=none
