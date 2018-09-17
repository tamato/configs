
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
call plug#end()
" :PlugInstall to install new plugins
" use :PlugUpdate to update or Install
" :PlugUpgrade will upgrade VimPlug

set formatoptions-=cro
" include fzf
" set rtp+=~/.fzf

set clipboard=unnamed
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
set scrolloff=10
filetype plugin indent on

" Disable auto comment continuation
set formatoptions-=cro

colorscheme skittles_berry

let mapleader = ","
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Fzf or Files
nnoremap <c-p> :FZF<cr>
nnoremap ; :Buffers<cr>

" for vim-airline
let g:airline_powerline_fonts = 1

" more comfy way of entering command mode
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" nnoremap <leader>c :
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
noremap <leader>x :x<cr>

" list and use a buffer
nnoremap <leader>b :ls<cr>:b
nnoremap <leader>v :ls<cr>:vsp<space>\|<space>b<space>

" Have search movements go to the top screen
nnoremap n nzt
nnoremap N Nzt
nnoremap g# g#zt
nnoremap g* q*zt
nnoremap # #zt
nnoremap * *zt


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
imap qr <esc>:w<cr>

" turnon highlighted searches
set hlsearch
" set viminfo^=h  " prevent vim from highlighting the last search on start up... doesn't seem to work...

" hit esc twice to disable highlight
nnoremap <silent> <esc><esc> :nohls<cr>

" Use ctrl+d to highlight all occurances of word under cursor. from:
"   http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches"
" nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Hide the cursor line when in InsertMode
:autocmd InsertLeave * set cursorline
:autocmd InsertEnter * set nocursorline

" Set working dir to current file
cmap cd cd %:p:h<cr>

" https://vi.stackexchange.com/questions/8128/how-to-toggle-comments-with-ctrl
" noremap <expr> <C-m> (synIDattr(synID(line("."), col("."), 0), "name") =~ 'comment\c') ?
" \ ':<S-Left>exe "<S-Right>normal! ".b:unCommentCommand<CR>' :
" \ ':<S-Left>exe "<S-Right>normal! ".b:commentCommand<CR>'
" 
" autocmd BufReadPost *.[ch] let b:commentCommand='I// '   "Comment for C files
" autocmd BufReadPost *.[ch] let b:unCommentCommand='^xx' "un-Comment for C files


" motions for jumping between '{' when the '{' is not in the first column.
" part of :help object-motions, :help <S-Left>
" :map [[ ?{<CR>w99[{
" ?{        = find a previous '{'
" <CR>      = enter
" w99
" :map ][ /}<CR>b99]}
" :map ]] j0[[%/{<CR>
" :map [] k$][%?}<CR>

" syntax highlight for glsl
autocmd! BufNewFile,BufRead *.vs,*.vert,*.fs,*.frag set ft=glsl

" Use <Esc> to leave terminal mode
:tnoremap <Esc> <C-\><C-n>

nnoremap <c-k><c-b> :NERDTreeToggle<cr>

