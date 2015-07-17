" This is atalw's .vimrc


" [ Vundle Setup ] {{{1 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" [ Preferences ] {{{1
let mapleader="\<Space>"		" Set global mapleader
set autoindent
set smarttab
set expandtab                           " Use spaces instead of tabs
set shiftwidth=4
set tabstop=4
set smartindent
set backspace=indent,eol,start
set history=1000
set nobackup
set noswapfile
set ttyfast
set hidden
" Appearance {{{2
set number				" Always show line numbers
set numberwidth=3
set cursorline				" Highlight current line
set ruler				" Show line number and cursor position
set wrap
" Colors and Theme {{{2
syntax enable
set background=dark
colorscheme gruvbox
" Searching and Moving {{{2
set ignorecase				" Ignore case when searching
set smartcase				" Be smart about cases
set incsearch				" Enable highlighted case-insensitive incremential search

" [ Mappings ] {{{1
" Escaping {{{2
inoremap jj <ESC>:w<CR>
inoremap jk <ESC>:w<CR>
nmap fq :q!<CR>
" Folding {{{2
nnoremap <Tab> za
" Window Switching {{{2
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Window Resizing {{{2
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :horizontal resize +1<CR>
nnoremap <Down> :horizonal resize -1<CR>

" Bubble single lines {{{2
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" [ Leader Mappings ] {{{1
" Surround selection with -- ` ' " {{{2
nnoremap <leader>` 0v$S`
nnoremap <leader>' viwS'
nnoremap <leader>" viwS"
" Super useful commands {{{2
noremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>
" Pasting, Copying and Cutting {{{2
map <Leader>p :set paste<CR>o<ESC>"*]p:set nopaste<CR>
map <leader>y "+y
" Vimrc related {{{2
" Update vimrc -- v OR ev {{{3
nmap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>v <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Autoload(source) vimrc after each save {{{3
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" Resize splits when window is resized {{{2
au VimResized * exe "normal! \<c-w>="
" [ Modeline ] {{{1
set modelines=1
" vim: set foldmethod=marker:
