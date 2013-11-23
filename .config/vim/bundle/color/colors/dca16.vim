" My own color scheme based on ansi_blows.
"
set bg=dark

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let s:black='#2E3436'
let s:boldBlack='#555753'
let s:red='#CC0000'
let s:boldRed='#EF2929'
let s:green='#4E9A06'
let s:boldGreen='#8AE234'
let s:brown='#aa5500'
let s:yellow='#FCE94F'
let s:blue='#3465A4'
let s:boldBlue='#729FCF'
let s:magenta='#75507B'
let s:boldMagenta='#AD7FA8'
let s:cyan='#06989A'
let s:boldCyan='#34E2E2'
let s:white='#D3D7CF'
let s:boldWhite='#EEEEEC'

exe 'hi Normal       guifg=' . s:white . ' guibg=' . s:black
exe 'hi SpecialKey   guifg=' . s:boldBlue
exe 'hi NonText      guifg=' . s:boldBlue . ' gui=none'
exe 'hi Directory    guifg=' . s:boldCyan
exe 'hi ErrorMsg     guifg=' . s:boldWhite . ' guibg=' . s:red
exe 'hi IncSearch    cterm=reverse gui=reverse'
exe 'hi Search       guifg=bg guibg=' . s:brown
exe 'hi MoreMsg      guifg=' . s:boldGreen . ' gui=none'
exe 'hi ModeMsg      guifg=' . s:boldWhite . ' gui=none'
exe 'hi LineNr       guifg=' . s:yellow
exe 'hi Question     guifg=' . s:boldGreen . ' gui=none'
exe 'hi StatusLine   cterm=reverse gui=reverse'
exe 'hi StatusLineNC cterm=reverse gui=reverse'
exe 'hi VertSplit    cterm=reverse gui=reverse'
exe 'hi Title        guifg=' . s:boldMagenta . ' gui=none'
exe 'hi Visual       cterm=reverse gui=reverse guibg=bg'
exe 'hi VisualNOS    guifg=' . s:boldWhite . ' gui=underline'
exe 'hi WarningMsg   guifg=' . s:boldRed
exe 'hi WildMenu     ctermbg=3 guifg=bg guibg=' . s:brown
exe 'hi Folded       ctermfg=3 ctermbg=7 guifg=' . s:brown . ' guibg=' . s:boldBlack
exe 'hi FoldColumn   ctermfg=3 ctermbg=7 guifg=' . s:brown . ' guibg=' . s:boldBlack
exe 'hi DiffAdd      guibg=' . s:blue
exe 'hi DiffChange   guibg=' . s:magenta
exe 'hi DiffDelete   cterm=none guifg=' . s:blue . ' guibg=' . s:cyan . ' gui=none'
exe 'hi DiffText     cterm=bold guifg=' . s:boldWhite . ' guibg=' . s:boldRed
exe 'hi SignColumn   ctermfg=3 ctermbg=7 guifg=' . s:brown . ' guibg=' . s:boldBlack
exe 'hi SpellBad     cterm=bold guifg=' . s:boldWhite . ' guisp=' . s:boldRed . ' gui=undercurl'
exe 'hi SpellCap     cterm=bold guifg=' . s:boldWhite . ' guisp=' . s:boldBlue . ' gui=undercurl'
exe 'hi SpellRare    cterm=bold guifg=' . s:boldWhite . ' guisp=' . s:boldMagenta . ' gui=undercurl'
exe 'hi SpellLocal   cterm=bold guifg=' . s:boldWhite . ' guisp=' . s:boldCyan . ' gui=undercurl'
exe 'hi Pmenu        guibg=' . s:magenta
exe 'hi PmenuSel     guibg=bg'
exe 'hi PmenuSbar    ctermfg=3 guifg=' . s:brown . ' guibg=fg'
exe 'hi PmenuThumb   cterm=reverse gui=reverse'
exe 'hi TabLine      cterm=underline guifg=fg guibg=bg gui=underline'
exe 'hi TabLineSel   cterm=bold guifg=' . s:boldWhite
exe 'hi TabLineFill  cterm=reverse gui=reverse'
exe 'hi CursorColumn ctermfg=7 ctermbg=7 cterm=bold guifg=' . s:boldWhite . ' guibg=fg'
exe 'hi CursorLine   cterm=underline gui=underline guibg=bg'
exe 'hi Cursor       cterm=reverse guifg=bg guibg=fg'
exe 'hi lCursor      cterm=reverse guifg=bg guibg=fg'
exe 'hi MatchParen   cterm=bold guifg=' . s:boldWhite . ' guibg=' . s:cyan
exe 'hi Comment      guifg=' . s:boldCyan
exe 'hi Constant     guifg=' . s:boldMagenta
exe 'hi Special      guifg=' . s:boldRed
exe 'hi Identifier   cterm=bold guifg=' . s:boldCyan . ' gui=bold'
exe 'hi Statement    guifg=' . s:yellow . ' gui=none'
exe 'hi PreProc      guifg=' . s:boldBlue
exe 'hi Type         guifg=' . s:boldGreen . ' gui=none'
exe 'hi Underlined   cterm=bold,underline guifg=' . s:boldBlue . ' gui=underline'
exe 'hi Ignore       guifg=bg'
exe 'hi Error        guifg=' . s:boldWhite . ' guibg=' . s:boldRed
exe 'hi Todo         guifg=bg guibg=' . s:brown

let colors_name = "dca16"

" vim: sw=2
