" Global Configuration:
" ---------------------

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start  " allow backspacing over everything in insert mode

set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set undolevels=5000 " save 5000 changes for undo action
set ignorecase      " do not concern the case in the search
set smartcase       " smartcase is caseinsenstive for lowercase phrases
                    " and casesensitiv if there is one uppercase letter
" set infercase       " adjust case of completion to typed text
set showmode        " If in Insert, Replace or Visual mode put a message on the last line.
set showcmd         " show last command in status line
set ruler           " show cursor position in status line
set scrolloff=3     " set X lines to the curors - when moving vertical..
set lazyredraw      " do not redraw while running macros
set pastetoggle=<F9>    " set F9 to toggle between paste and nopaste mode
set hidden          " allow to switch buffers without saving to file
set ttyfast         " use fast terminal connection
"set relativenumber  " use relative line numbering according to cursor

" In many terminal emulators the mouse works just fine, thus enable it.
" set mouse=a
set mouse=

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Set to auto read when a file is changed from the outside
set autoread
set timeout
set timeoutlen=800
set ttimeoutlen=-1
"set foldmethod=indent
set foldlevelstart=99   " start buffer unfolded
set shiftround          " shift to the next tab

" colorscheme desert
set background=dark

set thesaurus+=/home/daniel/.vim/thesaurus/openthesaurus.txt

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set modeline            " enable the use of modeline
set modelines=1         " number of lines to check for indentation settings
set nobackup		    " do not keep a backup file, use versions instead
"set backupext=.bak     " set the backup file extension - default ~
"set backup             " enables the backup of files
"set backupdir=$HOME/.vimbackup//    " but not when they clog .
"set directory=$HOME/.vimswap//      " Same for swap files
"set viewdir=$HOME/.vimviews//       " same for view filesV
set undofile            " save undohistory in file
set undodir=$HOME/.vimundo//
set viminfo='50,f1,:400,/100,<1000,%50,r/tmp,h,!
set wildmode=full
set wildmenu            " show a select menu for command suggestions
set wildignore=*.swp,*.bak,*.o,tags,*.sess  " ignored files for expand, glob and autocompletion
set pumheight=10        " show not more than 10 items in insert menu completion

"set cursorline          " mark the line the cursor is on
set linebreak           " break lines in a nice way
set display=lastline    " displays the visible part of the last line if it's to long
set textwidth=78
set formatoptions=croql
set colorcolumn=0       " show no colored column
set showbreak=->\       " string to mark automatic broken lines ->
set smartindent         " smart indentation
set smarttab            " smarttab to remove all spaces on linestart on <BS>
set completeopt=menu,longest,preview
set virtualedit=onemore " allow virtual edit in insert mode
set spelllang=de_20     " set language for the spellcheck
set spellsuggest=fast,10
set dictionary=/usr/share/dict/ngerman
set fileformats=unix,dos,mac " favorite fileformats
set encoding=utf-8           " set default-encoding to utf-8
set iskeyword+=_,-           " these characters also belong to a word
set matchpairs+=<:>          " angle brackets should also being matched by %
set cryptmethod=blowfish

set printoptions=paper:a4,syntax:y  " controls the default paper size and the printing of syntax highlighting (:n -> none)
set printfont=DejaVu\ Sans\ Mono

set diffopt+=iwhite         " ignore space changes in diff view
set sessionoptions=blank,buffers,curdir,folds,globals,localoptions,options,tabpages

set statusline=#%n\ %M%t\ [%{&paste?'PASTE:':''}%{&bomb?'BOMB:':''}%{&ft}:%{strlen(&fenc)?&fenc:'none'}]%r%=[%l,%c\ %2.3p%%]
set laststatus=2        " show statusline 0 = never; 1 = in splitmode; 2 = everytime

augroup Global
	au!
	" try to load a template if a file is new created
	" tamplates are named by filetypeextension.tpl
	au BufNewFile * silent! 0r $HOME/.vimtemplates/%:e.tpl
augroup END

" It seems that vim does not handle sucessive calls of the match command
" gracefully. Since BufWinEnter commands are executed every time a buffer is
" displayed (i.e., switching to another file), the match command is executed many
" times during a vim session. This seems to lead to a memory leak which slowly
" impacts performance (for example scrolling and writing become unbearable slow).
" Include the following line to fix the issue:
autocmd BufWinLeave * call clearmatches()
