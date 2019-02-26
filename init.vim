
" specify a directory for plugins
" - for NeoVim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/vimplug') 
" Must use single quotes, full github path could be used.
Plug 'https://github.com/shawncplus/skittles_berry.git'
Plug 'https://github.com/rust-lang/rust.vim.git'
Plug 'https://github.com/tikhomirov/vim-glsl.git'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',
Plug 'https://github.com/scrooloose/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim' handled by fzf
Plug 'scrooloose/nerdcommenter'
call plug#end()
" :PlugInstall to install new plugins
" use :PlugUpdate to update or Install
" :PlugUpgrade will upgrade VimPlug

" Disable comment continuation
set formatoptions-=cro
" include fzf
" set rtp+=~/.fzf

set clipboard+=unnamed
set clipboard+=unnamedplus
set nocompatible
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set cursorline
set ignorecase
set smartcase
set hidden
set scrolloff=3
filetype plugin indent on

colorscheme skittles_berry

let mapleader = ","
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Fzf or Files
nnoremap <c-p> :FZF<cr>
nnoremap <cr> :Buffers<cr>

" for vim-airline
let g:airline_powerline_fonts = 1

" more comfy way of moving between splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>k :qa!<cr>

" opens a terminal in current window and searches with ag
nnoremap <leader>f :term<space>ag<space>
nnoremap <leader>j :tab<space>term<space>ag<space>

" NerdTree goes to the current files location
nnoremap <leader>tt :NERDTreeFind<cr>

" list and use a buffer
nnoremap <leader>b :ls<cr>:b<space><C-Z><S-Tab>
nnoremap <leader>vb :ls<cr>:vsp<space>\|<space>b<space><C-Z><S-Tab>
nnoremap <leader>hb :ls<cr>:sp<space>\|<space>b<space><C-Z><S-Tab>
nnoremap <leader>tb :tabnew<cr>:ls<cr>:b<space><C-Z><S-Tab>

" from: https://stackoverflow.com/questions/22614280/vim-open-file-in-right-split
set splitright

" Center search movements to center screen
nnoremap n nzz
nnoremap N Nzz
nnoremap g# g#zz
nnoremap g* q*zz
nnoremap # #zz
nnoremap * *zz

" always show the status line
set laststatus=2

" don't bother with backup files, they just clutter everything.
set nobackup
set noswapfile

" have vim set the terminal's title.
set title

set visualbell
set noerrorbells

" i = insert mode
imap qr <esc>:w<cr>

" turnon highlighted searches
set hlsearch
" set viminfo^=h  " prevent vim from highlighting the last search on start up... doesn't seem to work...

" hit esc twice to disable highlight
nnoremap <silent> <esc><esc> :nohls<cr>

" Use ctrl+d to highlight all occurances of word under cursor. from:
"   http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches"

" Hide the cursor line when in InsertMode
:autocmd InsertLeave * set cursorline
:autocmd InsertEnter * set nocursorline

" syntax highlight for glsl
autocmd! BufNewFile,BufRead *.vs,*.vert,*.fs,*.frag set ft=glsl

nnoremap <c-k><c-b> :NERDTreeToggle<cr>
set wildignore+=*\\tmp\\*,*.swp,*.zip,*exe  " windows

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'wra'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_use_caching = 1

" NerdTree setting for bookmarks
let g:NERDTreeBookmarksFile = "~/config/nvim/.NERDTreeBookmarks"

" NerdCommenter
" Add a space between comment mark (the delimiter) and code
let g:NERDSpaceDelims = 1

" Left align commet marks
let g:NERDDefaultAlign = 'left'

" Don't comment empty lines
let g:NERDCommentEmptyLines = 1

" Finding files without CtrlP
set wildcharm=<C-Z>
" change this to ctrlP at some ponit
nnoremap <leader>ee :e **/*<C-z><S-Tab>

set path-=/usr/include
nnoremap <leader>ef :find **/*<C-z><S-Tab>

