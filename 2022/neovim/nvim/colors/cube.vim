colorscheme peachpuff
let g:colors_name = "cube"

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
if &background == 'dark'
    let s:black = 234
    let s:superdarkgrey = 235
    let s:darkgrey = 237
    let s:lightgrey = 243
    let s:white = 15
    let s:orange = 172
    let s:red = 167
    let s:blue = 75
    let s:green = 114
    let s:darkgreen = 72
    let s:bluishgreen = 81
    let s:yellow = 186
    let s:pink = 176
    let s:purple = 105
    let s:none = "None"
else
    let s:black = 254
    let s:superdarkgrey = 253
    let s:darkgrey = 251
    let s:lightgrey = 244
    let s:white = 234
    let s:orange = 202
    let s:red = 160
    let s:blue = 27
    let s:green = 64
    let s:darkgreen = 34
    let s:bluishgreen = 81
    let s:yellow = 94
    let s:pink = 176
    let s:purple = 05
    let s:none = "None"
endif

exec "hi Normal ctermbg=" .s:black " ctermfg=" .s:white
exec "hi Folded ctermbg=" .s:darkgrey "ctermfg=" .s:white
exec "hi StatusLine cterm=" .s:none "ctermbg=" .s:darkgrey "ctermfg=" .s:white
exec "hi StatusLineNC cterm=" .s:none "ctermbg=" .s:darkgrey "ctermfg=" .s:white
" tab bg
exec "hi TabLineFill cterm=" .s:none "ctermbg=" .s:black "ctermfg=" .s:white
" unselected tab
exec "hi TabLine cterm=" .s:none "ctermbg=" .s:darkgrey "ctermfg=" .s:white
" selected tab
exec "hi TabLineSel cterm=" .s:none "ctermbg=" .s:black "ctermfg=" .s:white
exec "hi VertSplit cterm=" .s:none "ctermbg=" .s:darkgrey "ctermfg=" .s:white
exec "hi LineNr ctermfg=" .s:lightgrey
exec "hi ColorColumn ctermbg=" .s:superdarkgrey
exec "hi SignColumn ctermbg=" .s:black
exec "hi Search ctermbg=" .s:blue "ctermfg=" .s:white
exec "hi IncSearch ctermbg=" .s:white "ctermfg=" .s:blue
exec "hi SpecialKey ctermfg=" .s:blue "ctermbg=" .s:red
exec "hi NonText ctermfg=" .s:lightgrey
exec "hi DiffAdd ctermfg=" .s:green
exec "hi DiffChange ctermfg=" .s:bluishgreen
exec "hi DiffDelete ctermfg=" .s:red
exec "hi DiffText ctermbg=" .s:black "ctermfg=" .s:yellow
exec "hi Visual ctermbg=" .s:black
exec "hi VisualNOS ctermbg=" .s:black
" nvim specific
exec "hi DiagnosticError ctermfg=" .s:red
exec "hi DiagnosticVirtualTextError ctermfg=" .s:red
exec "hi DiagnosticFloatingError ctermfg=" .s:red
exec "hi DiagnosticWarn ctermfg=" .s:yellow
exec "hi DiagnosticVirtualTextWarn ctermfg=" .s:yellow
exec "hi DiagnosticFloatingWarning ctermfg=" .s:yellow
exec "hi DiagnosticInfo ctermfg=" .s:lightgrey
exec "hi DiagnosticVirtualTextInfo ctermfg=" .s:lightgrey
exec "hi DiagnosticFloatingInformation ctermfg=" .s:lightgrey
exec "hi DiagnosticHint ctermfg=" .s:green
exec "hi DiagnosticVirtualTextHint ctermfg=" .s:green
exec "hi DiagnosticFloatingHint ctermfg=" .s:green
exec "hi LspReferenceText ctermbg=" .s:darkgrey
exec "hi LspReferenceRead ctermbg=" .s:darkgrey
exec "hi LspReferenceWrite ctermbg=" .s:darkgrey
" Syntax
exec "hi Comment ctermfg=" .s:lightgrey
exec "hi SpecialComment ctermfg=" .s:lightgrey
exec "hi Identifier ctermfg=" .s:darkgreen
exec "hi Type ctermfg=" .s:orange
exec "hi Statement ctermfg=" .s:red
exec "hi String ctermfg=" .s:green
exec "hi Constant ctermfg=" .s:yellow
exec "hi PreProc ctermfg=" .s:purple
exec "hi Special ctermfg=" .s:white
exec "hi Macro ctermfg=" .s:blue
exec "hi Precondit ctermfg=" .s:blue
exec "hi Function ctermfg=" .s:darkgreen
exec "hi Include ctermfg=" .s:orange
exec "hi Directory ctermfg=" .s:lightgrey
" Hover
exec "hi NormalFloat ctermbg=" .s:darkgrey "ctermfg=" .s:white
exec "hi FloatBorder ctermbg=" .s:darkgrey "ctermfg=" .s:white
exec "hi Pmenu ctermbg=" .s:darkgrey "ctermfg=" .s:white
exec "hi PmenuSBar ctermbg=" .s:darkgrey "ctermfg=" .s:white
" Indent-blankline
exec "hi IndentBlanklineChar ctermfg=" .s:darkgrey
exec "hi IndentBlanklineContextChar ctermfg=" .s:yellow
" Rust.vim
exec "hi rustTrait ctermfg=" .s:yellow
exec "hi rustEnum ctermfg=" .s:purple
exec "hi rustEnumVariant ctermfg=" .s:purple
exec "hi rustSelf ctermfg=" .s:purple
exec "hi rustStructure ctermfg=" .s:orange
" Telescope
exec "hi TelescopeSelection ctermbg=" .s:darkgrey "ctermfg=" .s:white

" match TrailingSpace /\s\+$/
" exec "hi TrailingSpace ctermbg=" .s:red
