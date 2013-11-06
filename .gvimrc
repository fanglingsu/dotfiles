set guiheadroom=0
set go=
colorscheme wombat
set background=dark

" Make external commands work through a pipe instead of a pseudo-tty
set noguipty

" set the X11 font to use
set guifont=Monospace\ 10

"set ch=2		    " Make command line two lines high
set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
