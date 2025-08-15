" Ansi Dim - A dim, soothing Vim color scheme using 16 ANSI colors

set background=dark
set t_Co=16
set notermguicolors

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "ansi-dim"

" ANSI color palette (16 colors, 0-15)
" 0: Black, 1: Red, 2: Green, 3: Yellow, 4: Blue, 5: Magenta, 6: Cyan, 7: White
" 8: Bright Black (Gray), 9: Bright Red, 10: Bright Green, 11: Bright Yellow
" 12: Bright Blue, 13: Bright Magenta, 14: Bright Cyan, 15: Bright White

" General UI highlight groups
hi Normal        ctermfg=none  ctermbg=none  cterm=none     " Default text
hi Cursor        ctermfg=0  ctermbg=7  cterm=none           " Cursor: Black on White
hi CursorLine    ctermfg=none  ctermbg=8  cterm=none        " Cursor line: Gray background
hi CursorColumn  ctermfg=none  ctermbg=8  cterm=none        " Cursor column: Gray background
hi LineNr        ctermfg=8  ctermbg=none  cterm=none        " Line numbers: Gray on Black
hi CursorLineNr  ctermfg=12  ctermbg=8  cterm=none          " Current line number: Bright Blue on Gray
hi Visual        ctermfg=none  ctermbg=4  cterm=none        " Visual selection: Blue background
hi VisualNOS     ctermfg=none  ctermbg=4  cterm=none        " Visual selection (not owning): Blue background
hi Search        ctermfg=0  ctermbg=6  cterm=none           " Search highlight: Black on Cyan
hi IncSearch     ctermfg=0  ctermbg=14  cterm=none          " Incremental search: Black on Bright Cyan
hi MatchParen    ctermfg=12  ctermbg=8  cterm=bold          " Matching parentheses: Bright Blue on Gray, bold
hi ColorColumn   ctermfg=none  ctermbg=8  cterm=none        " Color column: Gray background
hi Folded        ctermfg=12  ctermbg=8  cterm=none          " Folded text: Bright Blue on Gray
hi FoldColumn    ctermfg=12  ctermbg=0  cterm=none          " Fold column: Bright Blue on Black
hi SignColumn    ctermfg=7  ctermbg=0  cterm=none           " Sign column: White on Black
hi VertSplit     ctermfg=8  ctermbg=0  cterm=none           " Vertical split: Gray on Black
hi StatusLine    ctermfg=7  ctermbg=8  cterm=none           " Status line: White on Gray
hi StatusLineNC  ctermfg=8  ctermbg=0  cterm=none           " Non-active status line: Gray on Black
hi WildMenu      ctermfg=0  ctermbg=14  cterm=none          " Wildmenu: Black on Bright Cyan
hi Title         ctermfg=12  ctermbg=none  cterm=bold       " Titles: Bright Blue, bold
hi ModeMsg       ctermfg=10  ctermbg=none  cterm=none        " Mode message: Bright Green
hi MoreMsg       ctermfg=10  ctermbg=none  cterm=none        " More message: Bright Green
hi ErrorMsg      ctermfg=9  ctermbg=none  cterm=bold         " Error message: Bright Red, bold
hi WarningMsg    ctermfg=3  ctermbg=none  cterm=bold         " Warning message: Yellow, bold
hi Question      ctermfg=10  ctermbg=none  cterm=none        " Questions: Bright Green

" Syntax highlight groups
hi Comment       ctermfg=8  ctermbg=none  cterm=italic       " Comments: Gray
hi Constant      ctermfg=6  ctermbg=none  cterm=none         " Constants: Cyan
hi String        ctermfg=10  ctermbg=none  cterm=none        " Strings: Bright Green
hi Character     ctermfg=10  ctermbg=none  cterm=none        " Characters: Bright Green
hi Number        ctermfg=6  ctermbg=none  cterm=none         " Numbers: Cyan
hi Boolean       ctermfg=6  ctermbg=none  cterm=none         " Booleans: Cyan
hi Float         ctermfg=6  ctermbg=none  cterm=none         " Floats: Cyan
hi Identifier    ctermfg=12  ctermbg=none  cterm=none        " Identifiers: Bright Blue
hi Function      ctermfg=12  ctermbg=none  cterm=none        " Functions: Bright Blue
hi Statement     ctermfg=12  ctermbg=none  cterm=none        " Statements: Bright Blue
hi Conditional   ctermfg=12  ctermbg=none  cterm=none        " Conditionals: Bright Blue
hi Repeat        ctermfg=12  ctermbg=none  cterm=none        " Repeats: Bright Blue
hi Label         ctermfg=3  ctermbg=none  cterm=none         " Labels: Yellow
hi Operator      ctermfg=7  ctermbg=none  cterm=none         " Operators: White
hi Keyword       ctermfg=12  ctermbg=none  cterm=none        " Keywords: Bright Blue
hi Exception     ctermfg=9  ctermbg=none  cterm=none         " Exceptions: Bright Red
hi PreProc       ctermfg=5  ctermbg=none  cterm=none         " Preprocessor: Magenta
hi Include       ctermfg=5  ctermbg=none  cterm=none         " Includes: Magenta
hi Define        ctermfg=5  ctermbg=none  cterm=none         " Defines: Magenta
hi Macro         ctermfg=5  ctermbg=none  cterm=none         " Macros: Magenta
hi PreCondit     ctermfg=5  ctermbg=none  cterm=none         " Preconditionals: Magenta
hi Type          ctermfg=12  ctermbg=none  cterm=none        " Types: Bright Blue
hi StorageClass  ctermfg=12  ctermbg=none  cterm=none        " Storage classes: Bright Blue
hi Structure     ctermfg=12  ctermbg=none  cterm=none        " Structures: Bright Blue
hi Typedef       ctermfg=12  ctermbg=none  cterm=none        " Typedefs: Bright Blue
hi Special       ctermfg=14  ctermbg=none  cterm=none        " Specials: Bright Cyan
hi SpecialChar   ctermfg=14  ctermbg=none  cterm=none        " Special characters: Bright Cyan
hi Tag           ctermfg=14  ctermbg=none  cterm=none        " Tags: Bright Cyan
hi Delimiter     ctermfg=7  ctermbg=none  cterm=none         " Delimiters: White
hi SpecialComment ctermfg=8  ctermbg=none  cterm=none        " Special comments: Gray
hi Debug         ctermfg=14  ctermbg=none  cterm=none        " Debug: Bright Cyan
hi Underlined    ctermfg=12  ctermbg=none  cterm=underline   " Underlined text: Bright Blue, underlined
hi Ignore        ctermfg=8  ctermbg=none  cterm=none         " Ignored: Gray
hi Error         ctermfg=9  ctermbg=0  cterm=bold           " Errors: Bright Red on Black, bold
hi Todo          ctermfg=12  ctermbg=0  cterm=bold          " TODOs: Bright Blue on Black, bold

" Diff highlight groups
hi DiffAdd       ctermfg=10  ctermbg=2  cterm=none          " Diff add: Bright Green on Green
hi DiffChange    ctermfg=7  ctermbg=4  cterm=none           " Diff change: White on Blue
hi DiffDelete    ctermfg=9  ctermbg=1  cterm=none           " Diff delete: Bright Red on Red
hi DiffText      ctermfg=12  ctermbg=4  cterm=bold          " Diff text: Bright Blue on Blue, bold

" Spell checking
hi SpellBad      ctermfg=9  ctermbg=none  cterm=underline    " Spelling errors: Bright Red, underlined
hi SpellCap      ctermfg=3  ctermbg=none  cterm=underline    " Capitalization errors: Yellow, underlined
hi SpellRare     ctermfg=5  ctermbg=none  cterm=underline     " Rare words: Magenta, underlined
hi SpellLocal    ctermfg=14  ctermbg=none  cterm=underline    " Local words: Bright Cyan, underlined

" Popup menu
hi Pmenu         ctermfg=7  ctermbg=8  cterm=none           " Popup menu: White on Gray
hi PmenuSel      ctermfg=0  ctermbg=14  cterm=none          " Popup menu selected: Black on Bright Cyan
hi PmenuSbar     ctermfg=none  ctermbg=8  cterm=none        " Popup menu scrollbar: Gray
hi PmenuThumb    ctermfg=none  ctermbg=7  cterm=none         " Popup menu thumb: White

" Tabline
hi TabLine       ctermfg=7  ctermbg=8  cterm=none           " Tab line: White on Gray
hi TabLineSel    ctermfg=15  ctermbg=4  cterm=bold          " Selected tab: Bright White on Blue, bold
hi TabLineFill   ctermfg=8  ctermbg=0  cterm=none           " Tab line fill: Gray on Black

" Other UI elements
hi Directory     ctermfg=12  ctermbg=none  cterm=none        " Directory names: Bright Blue
hi NonText       ctermfg=8  ctermbg=none  cterm=none         " Non-text: Gray
hi SpecialKey    ctermfg=8  ctermbg=none  cterm=none         " Special keys: Gray
hi Conceal       ctermfg=8  ctermbg=none  cterm=none         " Concealed text: Gray
hi Menu          ctermfg=7  ctermbg=8  cterm=none           " Menu: White on Gray
hi Scrollbar     ctermfg=8  ctermbg=0  cterm=none           " Scrollbar: Gray on Black
hi Tooltip       ctermfg=7  ctermbg=8  cterm=none           " Tooltip: White on Gray
