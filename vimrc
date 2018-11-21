" specify a directory for plugins
" - for NeoVim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/vimplug') 
" Must use single quotes, full github path could be used.
Plug 'https://github.com/shawncplus/skittles_berry.git'
Plug 'https://github.com/rust-lang/rust.vim.git'
Plug 'https://github.com/tikhomirov/vim-glsl.git'
Plug 'https://github.com/peterhoeg/vim-qml'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()
" :PlugInstall to install new plugins
" :PlugUpdate to update or Install
" :PlugUpgrade will upgrade VimPlug

set nocompatible
set autoread
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set cursorline
set ignorecase
set smartcase
set scrolloff=3
filetype plugin indent on
set clipboard=unnamed

set fileformats=dos,unix

" use grep in vim on windows
set grepprg=grep\ -nH

" disable comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" allow buffers to be switched without saving
set hidden

colorscheme skittles_berry

let mapleader = ","
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" more comfy way of entering command mode
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" used letters:
" b
" f
" j
" k
" p
" q
" t
" v
" w
" x

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>k :qa!<cr>

" opens a terminal in current window and searches with ag
nnoremap <leader>f :term<space>++curwin<space>ag<space>
nnoremap <leader>j :tab<space>term<space>ag<space>

" NerdTree goes to the current files location
nnoremap <leader>t :NERDTreeFind<cr>

" list and use a buffer
nnoremap <leader>b :ls<cr>:b
nnoremap <leader>vb :ls<cr>:vsp<space>\|<space>b<space>
nnoremap <leader>hb :ls<cr>:sp<space>\|<space>b<space>
nnoremap <leader>tb :tabnew<cr>:ls<cr>:b<space>

" from: https://stackoverflow.com/questions/22614280/vim-open-file-in-right-split
set splitright

" Have search movements go to the top screen
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

" -- nnoremap, normal mode, non recursive command to map keys to a command or a different set of keys
" [n]noremap = [normal mode] noremap
" n[nore]map = n [non recursive] map
" [mode]unmap = unmap keys

" :map needs to know which mode to apply to. :map does not apply to all modes. :map is recursive by default
" other modes are
" v: visual and select
" x: visual only
" s: select only
" i: insert
" n: normal

" imap
" i = insert mode
inoremap qr <esc>:w<cr>

" turnon highlighted searches
set hlsearch
" set viminfo^=h  " prevent vim from highlighting the last search on start up... doesn't seem to work...

" hit esc twice to disable highlight
nnoremap <silent> <esc><esc> :nohls<cr>

" Hide the cursor line when in InsertMode
:autocmd InsertLeave * set cursorline
:autocmd InsertEnter * set nocursorline

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

" NerdTree toggle
map <c-k><c-b> :NERDTreeToggle<cr>

" Use ctrl+d to highlight all occurances of word under cursor. from:
"   http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches"
" nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" !!! Not using this because Ag playces a ^M at the end of every search result
" The Silver Searcher - replace :grep
" from https://robots.thoughtbot.com/faster-grepping-in-vim
" if executable('ag')
"     " Use ag over grep
"     set grepprg=ag\ --nogroup\ --nocolor
" 
"     " Use ag in CtrlP for listing file. Lightning fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag -l --nocolor -g %s""'
" 
"     " ag is fast enough that CtrlP doesn't need to cache
"     let g:ctrlp_use_caching = 0
" endif
" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" nnoremap \ :Ag<space>

set wildignore+=*\\tmp\\*,*.swp,*.zip,*exe  " windows

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'wra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|BuildSystem$\|Content$\|Documentation$\|Products$\|Support$\|Thirdparty$\|licensed$\|Scratch$\|Tools$\|^patient$\|^vessels$\|^body$',
    \ 'file': '\.exe$\|\.git$\|\.vpc$',
    \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_use_caching = 1

" NerdTree setting for bookmarks
let g:NERDTreeBookmarksFile = "/c/Users/terrya/.NERDTreeBookmarks"

" NerdCommenter
" Add a space between comment mark (the delimiter) and code
let g:NERDSpaceDelims = 1

" Left align commet marks
let g:NERDDefaultAlign = 'left'

" Don't comment empty lines
let g:NERDCommentEmptyLines = 1

