set nocompatible
execute pathogen#infect()
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set cursorline
set ignorecase
set smartcase
set scrolloff=10
filetype plugin indent on

colorscheme skittles_berry

let mapleader = ","
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" nnoremap <c-p> :CtrlP<cr>

" more comfy way of entering command mode
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" nnoremap <leader>c :
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>x :x<cr>

" list and use a buffer
nnoremap <leader>b :ls<cr>:b<space>

" always show the status line
set laststatus=2

" don't bother with backup files, they just clutter everything.
set nobackup
set noswapfile

" have vim set the terminal's title.
set title

set visualbell
set noerrorbells

" -- nnoremap, normal mode, non recursive command to map keys to a command or a different set of keys
" [n]noremap = [normal mode] noremap
" n[nore]map = n [non recursive] map

" :map needs to know which mode to apply to. :map does not apply to all modes. :map is recursive by default
" other modes are
" v: visual and select
" x: visual only
" s: select only
" i: insert
" n: normal

" imap
" i = insert mode
imap xx <esc>

" turnon highlighted searches
set hlsearch
" set viminfo^=h  " prevent vim from highlighting the last search on start up... doesn't seem to work...

" hit esc twice to disable highlight
nnoremap <silent> <esc><esc> :nohls<cr>

" Use ctrl+d to highlight all occurances of word under cursor. from:
"   http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches"
" nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" use Ctrl+PageUp / Down to move between buffers.
" nnoremap <c-pageup> :bnext<cr>
" nnoremap <c-pagedown> :bprevious<cr>

" Hide the cursor line when in InsertMode
:autocmd InsertLeave * set cursorline
:autocmd InsertEnter * set nocursorline


" syntax highlight for glsl
autocmd! BufNewFile,BufRead *.vs,*.vert,*.fs,*.frag set ft=glsl

