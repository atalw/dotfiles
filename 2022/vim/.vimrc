set nocompatible
filetype on

syntax on
" Important!!
if has('termguicolors')
    set termguicolors
endif
if has('gui_running')
    set background=light
else
    set background=dark
endif
" Fix italic comment background color issue
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
colorscheme gruvbox-material
" hi Comment term=bold cterm=NONE ctermfg=245 gui=NONE guifg=#928374


set autoindent
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent

set backspace=indent,eol,start

set encoding=utf-8

set number
set numberwidth=3
set ruler
set wrap
set list
set listchars=tab:\|\ ,trail:·,eol:¬
set scrolloff=5

set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000

set wildmenu
"Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest 
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" MAPPINGS ----------------------------------------- {{{1

" Escaping {{{2

inoremap jj <Esc>:w<CR>
inoremap jk <Esc>:w<CR>

nnoremap <Space> :

" }}}

" Navigating {{{2
map J 10j
map K 10k

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" }}}

" Folding {{{2

nnoremap <Tab> za
nnoremap <CR> za

" }}}

" Leader {{{2

let mapleader=","

noremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Pasting, Copying and Cutting
map <Leader>p :set paste<CR>"*]p:set nopaste<CR>
map <leader>y "+y

" }}}

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" }}}
