nnoremap <Space> <Nop>
let mapleader   = " "
let g:mapleader = " "

nnoremap ; :

" remap vim 0 to first non-blank character
map 0 ^

nmap <leader>w :w!<CR>

" start interactive EasyAlign in visual mode (e.g. vipea)
xmap ea <Plug>(EasyAlign)

" toggle NERDTree
map <silent> <F2> :NERDTreeToggle<CR>

" run make
map <F3> :!make<CR>

" run shell cmd in a new window
map <F4> :Shell<Space>

" toggle cursorline
map <silent> <F6> :set cursorline!<CR>

" toggle whitespace listing
noremap  <silent> <F5> :set list!<CR>
inoremap <silent> <F5> <C-o>:set list!<CR>
cnoremap <silent> <F5> <C-c>:set list!<CR>

" copy last yanked text to clipboard
nnoremap <C-c> :call system("xclip -selection clipboard", @")<CR>

" substitute all occurrences of the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/
vnoremap <leader>s <Esc>:%s/<c-r>=GetVisual()<CR>/

" go to beginning/end of line
map  <C-a> <ESC>^
map  <C-e> <ESC>$
imap <C-a> <ESC>I
imap <C-e> <ESC>A
xmap <C-a> ^
xmap <C-e> $

" disable highlight
map <silent> <leader><CR> :noh<CR>

" visual mode pressing * or # searches for the current selection
" from Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection()<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection()<CR>?<C-R>=@/<CR><CR>

" better way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" buffers
map <leader>f  :find<Space>
map <leader>b  :b<Space>
map <leader>bl :ls<CR>
map <leader>bd :Bclose<CR>
map <leader>ba :bufdo bd<CR>
map <leader>l  :bnext<CR>
map <leader>h  :bprevious<CR>

" tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" resize splits
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 11/10)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 10/11)<CR>
nnoremap <silent> <Leader>0 :exe "vertical resize " . (winwidth(0) * 11/10)<CR>
nnoremap <silent> <Leader>9 :exe "vertical resize " . (winwidth(0) * 10/11)<CR>

" toggle spell checking
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sc z=

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" opens a new tab with the current buffer's path
" useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" show/close git hunk
nmap <silent> <leader>gs <Plug>(GitGutterPreviewHunk)
nmap <silent> <leader>gc :bdelete gitgutter://hunk-preview<CR>
