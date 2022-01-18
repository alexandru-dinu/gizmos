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
set noshowmode
set laststatus=2
set number
set relativenumber
set scrolloff=10
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set ignorecase
set smartcase
set nowrap
set autoread
set nohlsearch
set incsearch
set hidden
set splitbelow
set splitright
set wildmenu
set lazyredraw
set ttimeoutlen=0
set updatetime=50
set backspace=indent,eol,start
set listchars=space:·,eol:$,tab:>-,trail:~,extends:>,precedes:<

" enable mouse in all modes (e.g. for easier selection)
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

" disable highlight
map <silent> <C-l> :noh<CR>

" toggle whitespace listing
noremap  <silent> <F3> :set list!<CR>
inoremap <silent> <F3> <C-o>:set list!<CR>
cnoremap <silent> <F3> <C-c>:set list!<CR>

" substitute all occurrences of the word under the cursor
func! GetVisual() range
    normal! ""gvy
    let l:sel = getreg('"')
    let l:sel = escape(sel, '^$.*\/~[]')
    let l:sel = substitute(sel, '\n', '\\n', 'g')
    return sel
endfunc
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
vnoremap <leader>r <Esc>:%s/<c-r>=GetVisual()<CR>/

" visual mode pressing * or # searches for the current selection
func! VisualSelection() range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let @/ = l:pattern
    let @" = l:saved_reg
endfunc
vnoremap <silent> * :<C-u>call VisualSelection()<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection()<CR>?<C-R>=@/<CR><CR>

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
Plug 'mhinz/vim-signify'

Plug 'junegunn/vim-easy-align' "{{{
    xmap ga <Plug>(EasyAlign)<C-x>
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

Plug 'vifm/vifm.vim' "{{{
    map <leader>vo :Vifm<CR>
    map <leader>vv :VsplitVifm<CR>
    map <leader>vh :SplitVifm<CR>
    map <leader>vt :TabVifm<CR>
    map <leader>vd :DiffVifm<CR>
"}}}

Plug 'deponian/vim-lightline-whitespace'
Plug 'itchyny/lightline.vim' "{{{
    let g:lightline = {
        \ 'colorscheme': 'powerline',
        \ 'active': {
        \ 	'left': [ [ 'mode', 'paste', 'spell' ],
        \             [ 'readonly', 'filename', 'modified' ],
        \             [ 'bufinfo', 'gitinfo' ] ],
        \   'right': [ [ 'whitespace' ],
        \              [ 'lineinfo' ],
        \              [ 'filetype', 'fileformat', 'fileencoding' ] ],
        \ },
        \ 'inactive': {
        \ 	'left': [ [ 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ] ],
        \ },
        \ 'component_function': {
        \   'fileencoding': 'LL_fileencoding',
        \   'lineinfo': 'LL_lineinfo',
        \   'bufinfo': 'LL_bufinfo',
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

    func! LL_bufinfo() abort
        let l:total = len(getbufinfo({'buflisted':1}))
        return printf('%d buf', total)
    endfunc

    func! LL_fileencoding() abort
        let l:enc = (&fenc !=# '' ? &fenc : &enc)
        return (enc == 'utf-8' ? '' : enc)
    endfunc

    func! LL_lineinfo() abort
        let l:li = line('.') . ':' . col('.')
        let l:pc = string(100 * line('.') / line('$'))
        return printf('%s %s%%', li, pc)
    endfunc
"}}}

call plug#end()

" colorscheme
if &diff | syntax off | else | syntax enable | endif
set background=dark
colorscheme desert

hi Comment    ctermfg=8 ctermbg=none cterm=none
hi Visual     ctermfg=8 ctermbg=7    cterm=reverse
hi LineNr     ctermfg=8 ctermbg=none cterm=none
hi SignColumn ctermbg=none
hi DiffAdd    ctermbg=none
hi DiffDelete ctermbg=none
hi DiffChange ctermbg=none
