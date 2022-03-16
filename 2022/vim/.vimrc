set nocompatible
filetype plugin on

" syntax on
syntax enable 
" Important!!
if has('termguicolors')
"    set termguicolors
endif
if has('gui_running')
    set background=light
else
    set background=dark
endif
" Fix italic comment background color issue
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:gruvbox_material_background = 'hard'
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
set mouse=a

set number
set numberwidth=3
set ruler
set wrap
" set nowrap
set breakindent
set list
set listchars=tab:\|\ ,trail:·,eol:¬
set scrolloff=5
set colorcolumn=80

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

"nnoremap <Space> :

" }}}

" Navigating {{{2
map J 10j
map K 10k

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Pane Creation
map <silent> <Space><C-a>j <C-w>s<C-j>
map <silent> <Space><C-a>l <C-w>v<C-l>

" Pane Switching (two options, remove whichever is not in use later
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l
map <silent> <C-a>h <C-w>h
map <silent> <C-a>j <C-w>j
map <silent> <C-a>k <C-w>k
map <silent> <C-a>l <C-w>l

" Pane Resizing
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>

" Tab Creation
nnoremap tt :tabedit<Space>

" Tab Navigating
" gt to go right, gT to go left
nnoremap gh gT
nnoremap gl gt

" Tab Reorganzing
nnoremap tmr :+tabmove<CR>
nnoremap tml :-tabmove<CR>

" }}}

" Folding {{{2

nnoremap <Tab> za
nnoremap <CR> za

" }}}

" Leader {{{2

let mapleader=" "

noremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>

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

" PLUGIN SETTINGS----------------------------------------- {{{1

" NerdCommenter {{{2
"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0

" }}}

" NERDTree {{{2

let NERDTreeShowHidden=1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader><C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" }}}

" coc.nvim {{{

" use <c-space>for trigger completion
"inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <NUL> coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" }}}

" }}}







" Experimental 
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
