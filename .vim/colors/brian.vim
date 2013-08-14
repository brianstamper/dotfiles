" Vim color file
" Maintainer:    Brian Stamper
" Last Change:    Whatever it says on Github
" Copied from delek and modified to my liking

hi clear

let colors_name = "brian"

" Normal should come first
hi Normal   ctermfg=7   ctermbg=0
hi Cursor   ctermfg=0   ctermbg=0
"hi lCursor

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi DiffAdd    ctermbg=LightBlue
hi DiffChange ctermbg=LightMagenta
hi DiffDelete ctermfg=Blue       ctermbg=LightCyan
hi DiffText   ctermbg=Red       cterm=bold
hi Directory  ctermfg=DarkBlue
hi ErrorMsg   ctermfg=White       ctermbg=DarkRed
hi FoldColumn ctermfg=DarkBlue       ctermbg=Grey
hi Folded     ctermbg=Grey       ctermfg=DarkBlue
hi IncSearch  cterm=reverse
hi LineNr     ctermfg=146       ctermbg=236
hi ModeMsg    cterm=bold
hi MoreMsg    ctermfg=DarkGreen
hi NonText    ctermfg=Blue
hi PmenuSel   ctermfg=White       ctermbg=DarkBlue
hi Question   ctermfg=DarkGreen
hi Search     ctermfg=NONE       ctermbg=Yellow
hi SpecialKey ctermfg=DarkBlue
hi StatusLine  cterm=NONE ctermbg=17 ctermfg=15
hi StatusLineNC cterm=NONE ctermbg=234 ctermfg=7
hi Title      ctermfg=DarkMagenta
hi VertSplit  cterm=reverse
hi Visual     ctermbg=NONE       cterm=reverse
hi VisualNOS  cterm=underline,bold
hi WarningMsg ctermfg=DarkRed
hi WildMenu   ctermfg=Black       ctermbg=Yellow

" syntax highlighting
hi Comment    cterm=NONE ctermfg=67
hi Constant   cterm=NONE ctermfg=228
hi Identifier cterm=NONE ctermfg=114
hi PreProc    cterm=NONE ctermfg=85
hi Special    cterm=NONE ctermfg=214
hi Statement  cterm=bold ctermfg=159
hi Type       cterm=NONE ctermfg=179

" vim: sw=2
