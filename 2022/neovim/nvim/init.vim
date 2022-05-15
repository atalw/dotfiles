set nocompatible
filetype plugin indent on

" syntax on
syntax enable 
" colorscheme one 
" if has('termguicolors')
"    set termguicolors
" endif
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
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

" augroup GruvboxMaterialCustom
"     autocmd!
"     autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
" augroup END

" colorscheme gruvbox-material
colorscheme peachpuff
set background=dark

" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
" Colours
" black = 234
" dark dark grey = 235
" dark grey = 237
" light grey = 243
" white = 15
" orange = 172
" red = 167
" blue = 75
" green = 114
" dark green = 72
" yellow = 186
" pink = 176
" purple = 105
"
" UI
hi Normal ctermbg=234 ctermfg=15
hi Folded ctermbg=237 ctermfg=15
hi StatusLine cterm=None ctermbg=237 ctermfg=15
hi StatusLineNC cterm=None ctermbg=237 ctermfg=15
hi TabLineFill cterm=None ctermbg=234 ctermfg=15 "(tab bg)
hi TabLine cterm=None ctermbg=237 ctermfg=15 "(unselected tab)
hi TabLineSel cterm=None ctermbg=234 ctermfg=15 "(selected tab)
hi VertSplit cterm=None ctermbg=237 ctermfg=15
hi LineNr ctermfg=243
hi ColorColumn ctermbg=235
hi SignColumn ctermbg=234
hi Search ctermbg=75 ctermfg=15
hi IncSearch ctermbg=15 ctermfg=75
hi SpecialKey ctermfg=75 ctermbg=167
hi NonText ctermfg=243
hi DiffAdd ctermfg=114
hi DiffChange ctermfg=81
hi DiffDelete ctermfg=167
hi DiffText ctermbg=234 ctermfg=186
hi Visual ctermbg=234
hi VisualNOS ctermbg=234
" nvim specific
hi DiagnosticError ctermfg=167
hi DiagnosticVirtualTextError ctermfg=167
hi DiagnosticFloatingError ctermfg=167
hi DiagnosticWarn ctermfg=186
hi DiagnosticVirtualTextWarn ctermfg=186
hi DiagnosticFloatingWarning ctermfg=186
hi DiagnosticInfo ctermfg=243
hi DiagnosticVirtualTextInfo ctermfg=243
hi DiagnosticFloatingInformation ctermfg=243
hi DiagnosticHint ctermfg=114
hi DiagnosticVirtualTextHint ctermfg=114
hi DiagnosticFloatingHint ctermfg=114
hi LspReferenceText ctermbg=237
hi LspReferenceRead ctermbg=237
hi LspReferenceWrite ctermbg=237
" Syntax
hi Comment ctermfg=243
hi SpecialComment ctermfg=243
hi Identifier ctermfg=71
hi Type ctermfg=172
hi Statement ctermfg=167
hi String ctermfg=114
hi Constant ctermfg=186
hi PreProc ctermfg=105
hi Special ctermfg=15
hi Macro ctermfg=75
hi Precondit ctermfg=75
hi Function ctermfg=72
hi Include ctermfg=172
hi Directory ctermfg=243
" Hover
hi NormalFloat ctermbg=237 ctermfg=15
hi FloatBorder ctermbg=237 ctermfg=15
hi Pmenu ctermbg=237 ctermfg=15
hi PmenuSBar ctermbg=237 ctermfg=15
" Indent-blankline
hi IndentBlanklineChar ctermfg=237
hi IndentBlanklineContextChar ctermfg=186
" Rust.vim
hi rustTrait ctermfg=186
hi rustEnum ctermfg=105
hi rustEnumVariant ctermfg=105
hi rustSelf ctermfg=105
hi rustStructure ctermfg=172
" Telescope
hi TelescopeSelection ctermbg=237 ctermfg=15

" match TrailingSpace /\s\+$/
" hi TrailingSpace ctermbg=167

set autoindent
set smarttab
set expandtab " Use spaces instead of tabs
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
" autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif
let git_vars = system("git config --get vim.vars")
if strlen(git_vars)
    for s in split(git_vars)
        exe "let" s
    endfor
endif

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

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

nnoremap <Tab> za
" unmap <C-i>
" nnoremap <CR> za


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
" augroup filetype_vim
"     autocmd!
"     autocmd FileType vim setlocal foldmethod=marker
" augroup END

" If the current file type is HTML, set indentation to 2 spaces.
" autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
" autocmd Filetype rust setlocal tabstop=4 shiftwidth=4 noexpandtab

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

" }}}

" Experimental 
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"


lua require("plugins")
