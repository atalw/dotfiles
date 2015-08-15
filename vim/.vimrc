" |-------|-
" | atalw |
" |-------|


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
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'othree/html5.vim'
Plugin 'ervandew/supertab'
Plugin 'kchmck/vim-coffee-script'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kana/vim-smartinput'
Plugin 'itchyny/lightline.vim'
Plugin 'hail2u/vim-css3-syntax'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" [ Preferences ] {{{1
let mapleader="\<Space>"		" Set global mapleader
set autoindent
set smarttab
" set expandtab                 " Use spaces instead of tabs
set shiftwidth=4
set tabstop=4
set smartindent
set backspace=indent,eol,start
set history=1000
set nobackup
set noswapfile

set ttyfast
set hidden
set breakindent
set autoread
" Save undo history {{{2
set undofile
set undodir=~/.vim/undodir
" Appearance {{{2
set number        " Always show line numbers
set numberwidth=3
set cursorline    " Highlight current line
set ruler         " Show line number and cursor position
set wrap
set wildmenu
set showmatch     " highlight matching [{()}]
set list
set listchars=tab:▸\ ,eol:¬
" Colors and Theme {{{2
syntax on
set background=dark
colorscheme  badwolf
" Searching and Moving {{{2
set ignorecase				" Ignore case when searching
set smartcase				" Be smart about cases
set incsearch				" Enable highlighted case-insensitive incremential search
set scrolloff=1
" [ Mappings ] {{{1
" Escaping {{{2
inoremap jj <ESC>:w<CR>
nmap fq :q!<CR>
" Folding {{{2
nnoremap <Tab> za
nnoremap <Enter> za
" Window Switching {{{2
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Window Resizing {{{2
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Bubble single lines {{{2
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Movement {{{2
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" [ Leader Mappings ] {{{1
" Super useful commands {{{2
noremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
" Pasting, Copying and Cutting {{{2
map <Leader>p :set paste<CR>"*]p:set nopaste<CR>
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
" [ Plugins ] {{{1
" Nerdtree {{{2
map <C-n><C-t> :NERDTreeToggle<CR>
" Start NERDTree automatically when vim starts (if no file is specified)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Exit Vim if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Display Bookmarks by default
let NERDTreeShowBookmarks=1
" Lightline{{{2
set laststatus=2
let g:lightline = {
	 \ 'colorscheme': 'powerline',
	  \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
	  \ },
	  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
	  \ 'component': {
	  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
	  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
	  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	  \ },
	  \ 'component_visible_condition': {
	  \   'readonly': '(&filetype!="help"&& &readonly)',
	  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
	  \ },
	  \ }
" Tabularize {{{2
vnoremap <leader>t :Tabular<space>/
" Syntastic {{{2
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 2
let g:CSSLint_FileTypeList = ['css', 'less', 'sess']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {
		\ "mode": "passive",
		\ "active_filetypes": ["ruby"],
		\ "passive_filetypes": [] }
" YCM {{{2
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
" SuperTab {{{2
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
" Ultisnips {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="s<tab>"
" Toggle errors
nmap <leader>st :SyntasticToggleMode<CR>
" [ Modeline ] {{{1
set modelines=1
" vim: set foldmethod=marker:
