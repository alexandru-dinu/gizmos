" Inspired from https://github.com/AlessandroYorba/Sierra

hi clear

if exists("syntax_on")
    syntax reset
endif

" avoid fg == bg
if &diff
    syntax off
endif

set background=dark
let g:colors_name="sierra"

hi TabLineFill      ctermfg=NONE ctermbg=234  cterm=NONE
hi CursorColumn     ctermfg=NONE ctermbg=236  cterm=NONE
hi CursorLine       ctermfg=NONE ctermbg=236  cterm=NONE
hi ColorColumn      ctermfg=NONE ctermbg=236  cterm=NONE
hi Cursor           ctermfg=16   ctermbg=231  cterm=NONE
hi Conditional      ctermfg=66   ctermbg=NONE cterm=NONE
hi LineNr           ctermfg=102  ctermbg=NONE cterm=NONE
hi Comment          ctermfg=102  ctermbg=NONE cterm=NONE
hi Todo             ctermfg=102  ctermbg=NONE cterm=reverse
hi SignColumn       ctermfg=109  ctermbg=NONE cterm=NONE
hi Search           ctermfg=109  ctermbg=NONE cterm=reverse
hi Statement        ctermfg=109  ctermbg=NONE cterm=NONE
hi Identifier       ctermfg=109  ctermbg=NONE cterm=NONE
hi Label            ctermfg=131  ctermbg=NONE cterm=NONE
hi Constant         ctermfg=131  ctermbg=NONE cterm=NONE
hi Special          ctermfg=138  ctermbg=NONE cterm=NONE
hi Directory        ctermfg=138  ctermbg=NONE cterm=NONE
hi StorageClass     ctermfg=138  ctermbg=NONE cterm=NONE
hi Function         ctermfg=152  ctermbg=NONE cterm=NONE
hi FoldColumn       ctermfg=152  ctermbg=NONE cterm=NONE
hi Type             ctermfg=167  ctermbg=NONE cterm=NONE
hi Title            ctermfg=167  ctermbg=NONE cterm=NONE
hi PreProc          ctermfg=167  ctermbg=NONE cterm=NONE
hi ErrorMsg         ctermfg=167  ctermbg=NONE cterm=NONE
hi WarningMsg       ctermfg=167  ctermbg=NONE cterm=NONE
hi CursorLineNR     ctermfg=167  ctermbg=NONE cterm=NONE
hi Error            ctermfg=167  ctermbg=NONE cterm=reverse
hi Number           ctermfg=174  ctermbg=NONE cterm=NONE
hi MoreMsg          ctermfg=179  ctermbg=NONE cterm=NONE
hi Question         ctermfg=179  ctermbg=NONE cterm=NONE
hi Underlined       ctermfg=180  ctermbg=NONE cterm=NONE
hi String           ctermfg=181  ctermbg=NONE cterm=NONE
hi Normal           ctermfg=188  ctermbg=NONE cterm=NONE
hi ModeMsg          ctermfg=188  ctermbg=NONE cterm=NONE
hi PmenuSbar        ctermfg=236  ctermbg=236  cterm=NONE
hi PmenuThumb       ctermfg=236  ctermbg=236  cterm=NONE
hi NonText          ctermfg=240  ctermbg=NONE cterm=NONE
hi TabLine          ctermfg=243  ctermbg=234  cterm=NONE
hi StatusLineNC     ctermfg=243  ctermbg=234  cterm=NONE
hi StatusLineTermNC ctermfg=243  ctermbg=234  cterm=NONE
hi VertSplit        ctermfg=243  ctermbg=235  cterm=NONE
hi Pmenu            ctermfg=243  ctermbg=236  cterm=NONE
hi Folded           ctermfg=243  ctermbg=NONE cterm=NONE
hi SpecialComment   ctermfg=243  ctermbg=NONE cterm=reverse
hi VimCommentTitle  ctermfg=243  ctermbg=NONE cterm=reverse
hi SpecialKey       ctermfg=247  ctermbg=NONE cterm=NONE
hi Operator         ctermfg=250  ctermbg=NONE cterm=NONE
hi Visual           ctermfg=250  ctermbg=16   cterm=reverse
hi WildMenu         ctermfg=250  ctermbg=NONE cterm=reverse
hi StatusLine       ctermfg=255  ctermbg=234  cterm=NONE
hi TabLineSel       ctermfg=255  ctermbg=234  cterm=NONE
hi StatusLineTerm   ctermfg=255  ctermbg=234  cterm=NONE
hi PmenuSel         ctermfg=255  ctermbg=236  cterm=NONE
hi MatchParen       ctermfg=255  ctermbg=95   cterm=NONE

hi SpellLocal       ctermfg=65   ctermbg=NONE cterm=undercurl
hi SpellCap         ctermfg=111  ctermbg=NONE cterm=undercurl
hi SpellBad         ctermfg=196  ctermbg=NONE cterm=undercurl
hi SpellRare        ctermfg=208  ctermbg=NONE cterm=undercurl

hi DiffChange       ctermfg=66   ctermbg=NONE cterm=reverse
hi DiffAdd          ctermfg=109  ctermbg=NONE cterm=reverse
hi DiffDelete       ctermfg=131  ctermbg=NONE cterm=reverse
