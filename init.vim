
" specify a directory for plugins
" - for NeoVim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Download vim plug from the following:
"   https://github.com/junegunn/vim-plug
"   NeoVim - file from vim-plug goes: ~/.local/share/nvim/site/autoload/
"
" vim-plug will be stored in a separate area from the plug-ins it downloads
call plug#begin('~/.local/share/nvim/plugged')
" Must use single quotes, full github path could be used.
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
Plug 'neoclide/coc.nvim', {'branch':'release'}

"" -------------------- Color Schemes --------------------""
Plug 'shawncplus/skittles_berry'
Plug 'joshdick/onedark.vim'
Plug 'marciomazza/vim-brogrammer-theme'
Plug 'srcery-colors/srcery-vim'
Plug 'jansenfuller/crayon'
Plug 'agude/vim-eldar'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'drewtempelmeyer/palenight.vim'
"" -------------------- Syntax Highlighting -------------""
Plug 'bfrg/vim-cpp-modern'
Plug 'udalov/kotlin-vim'
call plug#end()
" :PlugInstall to install new plugins
" use :PlugUpdate to update or Install
" :PlugUpgrade will upgrade VimPlug

" include fzf
" set rtp+=~/.fzf

set clipboard+=unnamed
set clipboard+=unnamedplus
set nocompatible
syntax on
set tabstop=3
set shiftwidth=3
set expandtab
set number
set relativenumber
set cursorline
set ignorecase
set smartcase
set hidden
set scrolloff=3
set mouse=a

" toggle whitespace
noremap <F5> :set list!<CR>
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.

filetype plugin indent on

" disable comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

colorscheme brogrammer

let mapleader = ","
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Fzf or Files
nnoremap <c-p> :FZF<cr>
nnoremap <leader>b :Buffers<cr>

" for vim-airline
let g:airline_powerline_fonts = 1

" more comfy way of moving between splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" better way of moving windows.
nnoremap gH <C-w>H
nnoremap gJ <C-w>J
nnoremap gK <C-w>K
nnoremap gL <C-w>L

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>k :qa!<cr>

" use for grouping regex's
cnoremap <leader>\ \(\)<Left><Left>

" use for finding exact matches
cnoremap <leader>< \<\><Left><Left>
cnoremap <leader>> \<\><Left><Left>

" opens a terminal in current window and searches with ag
nnoremap <leader>f :term<space>ag<space>
nnoremap <leader>j :tab<space>term<space>ag<space>
" list and use a buffer
nnoremap <leader>db :ls<cr>:bd
nnoremap <leader>da :w<cr>:%bd<cr>:e#<cr>:bd#<cr>

" from: https://stackoverflow.com/questions/22614280/vim-open-file-in-right-split
set splitright

" Have search movements go to the center screen
" nnoremap n nzz
" nnoremap N Nzz
" nnoremap g# g#zz
" nnoremap g* q*zz
" nnoremap # #zz
" nnoremap * *zz

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

"http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap! linebreak! nolist
" force learning to run it on and off when needed.
set nowrap


" turnon highlighted searches
set hlsearch
" set viminfo^=h  " prevent vim from highlighting the last search on start up... doesn't seem to work...

" hit esc twice to disable highlight
nnoremap <silent> <leader><leader> :nohls<cr>



" Use ctrl+d to highlight all occurances of word under cursor. from:
"   http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches"

" syntax highlight for glsl
autocmd! BufNewFile,BufRead *.vs,*.vert,*.fs,*.frag set ft=glsl

" NerdCommenter
" Add a space between comment mark (the delimiter) and code
let g:NERDSpaceDelims = 1
autocmd InsertLeave * set cursorline
autocmd InsertEnter * set nocursorline

" Left align commet marks
let g:NERDDefaultAlign = 'left'

" Don't comment empty lines
let g:NERDCommentEmptyLines = 1
" Use <Esc> to leave terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap qr <C-\><C-n>

" Finding files without CtrlP
set wildcharm=<C-Z>
" change this to ctrlP at some ponit
nnoremap <leader>ee :e **/*<C-z><S-Tab>

set path-=/usr/include
nnoremap <leader>ef :find **/*<C-z><S-Tab>

" " Gutentag config
" let g:gutentags_project_root = ['.project_root']
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" " debug option, read messages with :messages
" let g:gutentags_trace = 0
" " let g:gutentags_modules = ['universal-ctags.ctags']
" " let g:gutentags_modules = ['cscope']
" " let g:gutentags_modules = ['ctags', 'gtags_cscope']
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" let g:gutentags_exclude_filetypes = ['*.js']
" let g:gutentags_resolve_symlinks = 1
" " optional to focus to quickfix window after search
" let g:gutentags_plus_switch = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" --smart-case is the default
nnoremap \ :Ag<cr>

"========= Nerd Commenter formatting ============
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"==================== Nerd Tree ==================== 
" NerdTree goes to the current files location
nnoremap <leader>tt :NERDTreeFind<cr>

" Close NERDTree after opening a file
let NERDTreeQuitOnOpen=1

nnoremap <c-k><c-b> :NERDTreeToggle<cr>
set wildignore+=*\\tmp\\*,*.swp,*.zip,*exe  " windows

" NerdTree setting for bookmarks
let g:NERDTreeBookmarksFile = "~/.local/share/nvim/"

"=================== Cpp Highlight ========================
" let c_no_curly_error = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
"   if (has("nvim"))
"     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif


" Automatic always clear white space
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

