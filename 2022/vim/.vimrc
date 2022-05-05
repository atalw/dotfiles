set nocompatible
filetype plugin indent on

" syntax on
syntax enable 
" colorscheme one 
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

let g:gruvbox_material_palette = gruvbox_material#get_palette('hard', 'original')
let g:gruvbox_material_enable_bold = '0'
" let g:gruvbox_material_ui_contrast = 'high'
let g:gruvbox_material_transparent_background = '1'
let g:gruvbox_material_current_word = 'grey background'

function! s:gruvbox_material_custom() abort
	let l:palette = gruvbox_material#get_palette('dark', 'original')
	call gruvbox_material#highlight('MatchParen', l:palette.none, l:palette.grey1)
	" call gruvbox_material#highlight('Visual', l:palette.fg0, l:palette.grey2)
endfunction

augroup GruvboxMaterialCustom
	autocmd!
	autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END

colorscheme gruvbox-material

set autoindent
set smarttab
set noexpandtab " Use spaces instead of tabs 
" set expandtab " Use spaces instead of tabs 
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent

set backspace=indent,eol,start

set encoding=utf-8
set mouse=a
set clipboard=unnamed

set number
set numberwidth=3
set ruler
set wrap
" set nowrap
set breakindent
set list
" set listchars=tab:\|\ ,trail:·,eol:¬
set listchars=tab:\ \ ,trail:·
" set listchars=trail:·
set scrolloff=5
set colorcolumn=100

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
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,*.swo

set nofoldenable
set nobackup
set noswapfile

set foldminlines=30
set foldnestmax=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif

" set nofoldenable

" MAPPINGS ----------------------------------------- {{{1

" Escaping {{{2

inoremap jj <Esc>:w<CR>
inoremap jk <Esc>:w<CR>

"nnoremap <Space> :

" }}}

" Navigating {{{2
map J 15j
map K 15k

" Move vertically by visual line
nnoremap j gj
nnoremap k gk


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

" nnoremap <Tab> za
" unmap <C-i>
nnoremap <CR> za


" }}}

" Leader {{{2

let mapleader=" "

noremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>

" Pane Creation
map <silent> <leader><leader>j <C-w>s<C-j>
map <silent> <leader><leader>l <C-w>v<C-l>

" Pasting, Copying and Cutting
map <leader>p :set paste<CR>"*]p:set nopaste<CR>
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
" set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

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
autocmd Filetype rust setlocal tabstop=4 shiftwidth=4 noexpandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" autocmd FileType rust setlocal foldmethod=expr foldexpr=RustFold()

" Save folds and load on next file open
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 

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
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Nerdtree config for wildignore
let NERDTreeRespectWildIgnore=1

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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use H to show documentation in preview window.
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

set updatetime=300
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Run the Code Lens action on the current line.
nmap <leader>mm  <Plug>(coc-codelens-action)

" }}}

" FastFold {{{2

" Don't update folds on save
let g:fastfold_savehook = 0

" }}}

" IndentLine {{{
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" }}}
" }}}

" Experimental 
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
