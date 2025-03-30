"--- init ----------------------------------------------------------------------

hi clear

if exists('syntax_on')
  syntax reset
endif

syntax enable
set background=dark

"--- colors --------------------------------------------------------------------

hi Cursor           ctermbg=7    ctermfg=NONE cterm=NONE

hi Normal           ctermbg=NONE ctermfg=NONE cterm=NONE
hi Title            ctermbg=NONE ctermfg=NONE cterm=BOLD
hi Comment          ctermbg=NONE ctermfg=6    cterm=NONE
hi SpecialComment   ctermbg=NONE ctermfg=6    cterm=BOLD
hi Todo             ctermbg=NONE ctermfg=1    cterm=BOLD
hi Whitespace       ctermbg=NONE ctermfg=7    cterm=NONE

hi LineNr           ctermbg=NONE ctermfg=7    cterm=NONE
hi CursorLineNr     ctermbg=NONE ctermfg=7    cterm=NONE
hi ColorColumn      ctermbg=7    ctermfg=NONE cterm=NONE
hi SignColumn       ctermbg=7    ctermfg=NONE cterm=NONE

hi Folded           ctermbg=NONE ctermfg=4    cterm=NONE
hi FoldColumn       ctermbg=NONE ctermfg=4    cterm=NONE

hi Underlined       ctermbg=NONE ctermfg=NONE cterm=UNDERLINE

hi Visual           ctermbg=15   ctermfg=NONE cterm=NONE
hi VisualNOS        ctermbg=NONE ctermfg=NONE cterm=UNDERLINE
hi MatchParen       ctermbg=NONE ctermfg=3    cterm=BOLD
hi IncSearch        ctermbg=11   ctermfg=NONE cterm=NONE
hi Search           ctermbg=11   ctermfg=NONE cterm=NONE
hi CursorColumn     ctermbg=15   ctermfg=NONE cterm=NONE
hi CursorLine       ctermbg=15   ctermfg=NONE cterm=NONE
hi ColorColumn      ctermbg=15   ctermfg=NONE cterm=NONE

hi StatusLine       ctermbg=NONE ctermfg=0    cterm=NONE
hi StatusLineNC     ctermbg=NONE ctermfg=0    cterm=NONE
hi VertSplit        ctermbg=NONE ctermfg=0    cterm=NONE
hi WinSeparator     ctermbg=NONE ctermfg=0    cterm=NONE
hi WildMenu         ctermbg=NONE ctermfg=0    cterm=REVERSE
hi ModeMsg          ctermbg=NONE ctermfg=NONE cterm=BOLD

hi DiffAdd          ctermbg=10   ctermfg=NONE cterm=NONE
hi DiffDelete       ctermbg=9    ctermfg=9    cterm=NONE
hi DiffChange       ctermbg=15   ctermfg=NONE cterm=NONE
hi DiffText         ctermbg=11   ctermfg=NONE cterm=NONE

hi Pmenu            ctermbg=15   ctermfg=NONE cterm=NONE
hi PmenuSel         ctermbg=7    ctermfg=NONE cterm=NONE
hi PmenuSbar        ctermbg=15   ctermfg=NONE cterm=NONE
hi PmenuThumb       ctermbg=7    ctermfg=NONE cterm=NONE

hi SpellBad         ctermbg=NONE ctermfg=1    cterm=UNDERCURL
hi SpellCap         ctermbg=NONE ctermfg=1    cterm=UNDERCURL
hi SpellLocal       ctermbg=NONE ctermfg=9    cterm=UNDERCURL
hi SpellRare        ctermbg=NONE ctermfg=9    cterm=UNDERCURL

hi ErrorMsg         ctermbg=NONE ctermfg=1    cterm=REVERSE
hi WarningMsg       ctermbg=NONE ctermfg=1    cterm=NONE
hi MoreMsg          ctermbg=NONE ctermfg=4    cterm=NONE
hi Question         ctermbg=NONE ctermfg=4    cterm=NONE

hi TabLine          ctermbg=7    ctermfg=NONE cterm=NONE
hi TabLineSel       ctermbg=7    ctermfg=NONE cterm=BOLDUNDERLINE
hi TabLineFill      ctermbg=7    ctermfg=NONE cterm=NONE

hi Error            ctermbg=NONE ctermfg=1    cterm=REVERSE
hi Ignore           ctermbg=NONE ctermfg=NONE cterm=NONE

"--- clear ---------------------------------------------------------------------

hi clear Number
hi clear Character
hi clear Statement
hi clear Type
hi clear Function
hi clear PreProc
hi clear Special
hi clear Identifier
hi clear Constant
hi clear Boolean
hi clear String
hi clear Delimiter
hi clear Conceal
hi clear Directory

"--- links ---------------------------------------------------------------------

" vim
hi link Directory  Title

" R
hi link rOKeyword  SpecialComment
hi link rOTag      SpecialComment
hi link rOTitleTag SpecialComment
hi link rOExamples Comment
hi link rOTitle    Comment

" markdown
hi link markdownHeadingDelimiter Title
hi link markdownCodeDelimiter    SpecialComment

" rmarkdown
hi link rmdCodeDelim       WarningMsg
hi link rmdRChunkDelim     WarningMsg
hi link rmdInlineDelim     WarningMsg
hi link rmdYamlBlockDelim  WarningMsg

hi link SpecialChar        Normal
hi link SpecialKey         SpecialComment
hi link Conceal            SpecialComment
hi link NonText            Comment
hi link Whitespace         Comment

" html
hi link htmlTag             Title
hi link htmlEndTag          Title
hi link htmlTagName         Title
hi link htmlSpecialTagName  Title

" quick fix window
hi link QuickFixLine       Visual
hi link qfFileName         Title
hi link qfLineNr           Comment
hi link qfSeparator        Comment

" vim help
hi link helpSectionDelim   Comment
hi link helpHyperTextJump  Title
hi link helpExample        Comment
hi link helpNote           Todo
hi link helpHyperOption    SpecialComment
hi link helpSpecial        SpecialComment
hi link helpHyperTextEntry SpecialComment
hi link helpCommand        SpecialComment

