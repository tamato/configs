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

" imap
" i = insert mode
imap xx <esc>

colorscheme skittles_berry

" nnoremap:
" n = normal mode
" nore = no recursion
" map

" map ctrl+tab and ctrl+shift+tab to cycle buffers
nnoremap <C-pageup> :bnext<cr>
nnoremap <C-pagedown> :bprevious<cr>

let mapleader = ","
nnoremap <leader>d dd
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" CtrlP
nnoremap <c-p> :CtrlP<cr>

" save files
noremap <c-s> :w<cr>

" more comfy way of entering command mode
nnoremap <leader>c :

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






