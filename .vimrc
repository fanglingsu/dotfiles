" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

set nocompatible

" make vim respect the xdg base directory spec.
set runtimepath+=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after

call plug#begin('~/.config/vim/bundle')
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'fanglingsu/vim-fastwordcompleter'
Plug 'fanglingsu/vim-whitespace'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'jeetsukumaran/vim-buffergator', { 'on': 'BuffergatorToggle' }
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
Plug 'vimoutliner/vimoutliner', { 'for': 'otl' }
Plug 'vimwiki/vimwiki'
Plug '~/.config/vim/bundle/color-settings'
Plug '~/.config/vim/bundle/filetype-settings'
call plug#end()

" Global Configuration:
"
syntax on
filetype plugin indent on

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set autoread                    " set to auto read when a file is changed from the outside
set background=dark
set backspace=2                 " allow backspacing over everything in insert mode
set clipboard+=unnamed          " yank and copy to X clipboard
set colorcolumn=0               " show no colored column
set completeopt=menu,longest,preview
set cryptmethod=blowfish
"set cursorline                 " mark the line the cursor is on
set diffopt+=iwhite             " ignore space changes in diff view
set directory=$XDG_CACHE_HOME/vim,/tmp,.    " set directories for swap files
set display=lastline            " displays the visible part of the last line if it's to long
set encoding=utf-8              " set default-encoding to utf-8
set expandtab                   " spaces instead of tabs
set fileformats=unix,dos,mac    " favorite fileformats
set foldlevelstart=99           " start buffer unfolded
set formatoptions=croql
set hidden                      " allow to switch buffers without saving to file
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight search matches
set ignorecase                  " do not concern the case in the search
set incsearch                   " do incremental searching
set iskeyword+=_,-              " these characters also belong to a word
set laststatus=2                " show statusline 0 = never; 1 = in splitmode; 2 = everytime
set lazyredraw                  " do not redraw while running macros
set linebreak                   " break lines in a nice way
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ ,nbsp:^
set matchpairs+=<:>             " angle brackets should also being matched by %
set modeline                    " enable the use of modeline
set modelines=1                 " number of lines to check for indentation settings
set mouse=
set nobackup                    " do not keep a backup file, use versions instead
set number                      " show line numbers
set relativenumber              " show relative line numbers
set pastetoggle=<F9>            " set F9 to toggle between paste and nopaste mode
set printfont=DejaVu\ Sans\ Mono
set printoptions=paper:a4,syntax:y
set pumheight=10                " show not more than 10 items in insert menu completion
set ruler                       " show cursor position in status line
set scrolloff=3                 " set X lines to the curors - when moving vertical
set sessionoptions=blank,buffers,curdir,folds,globals,localoptions,options,tabpages
set shiftround                  " shift to the next tab
set shiftwidth=4                " n cols for auto-indenting
set showbreak=->\               " string to mark automatic broken lines ->
set showcmd                     " display incomplete commands
set showmode                    " if in Insert, Replace or Visual mode put a message on the last line.
set sidescrolloff=5
set smartcase
set smartindent                 " smart indentation
set smarttab                    " smarttab to remove all spaces on linestart on <BS>
set softtabstop=4
set spelllang=en,de             " set language for the spellcheck
set spellsuggest=fast,10
set statusline=#%n\ %M%t\ [%{&paste?'PASTE:':''}%{&bomb?'BOMB:':''}%{&ft}:%{strlen(&fenc)?&fenc:'none'}]%r%=[%l,%c\ %2.3p%%]
set tabstop=4                   " tabs appear as n number of columns
set textwidth=78
set thesaurus+=$XDG_CONFIG_HOME/vim/thesaurus/openthesaurus.txt
set spellfile+=$XDG_CONFIG_HOME/vim/spell/de.utf8.add
set spellfile+=$XDG_CONFIG_HOME/vim/spell/en.utf8.add
set timeout
set timeoutlen=800
set ttimeoutlen=-1
set ttyfast                     " use fast terminal connection
set undodir=$XDG_CACHE_HOME/vim
set undofile                    " save undohistory in file
set undolevels=5000             " save 5000 changes for undo action
set undoreload=10000            " maximum number lines to save for undo on a buffer reload
set viminfo='50,f1,:400,/100,<1000,%50,r/tmp,h,!,n$XDG_CACHE_HOME/vim/viminfo
set virtualedit=onemore         " allow virtual edit in insert mode
set wildignore=*.swp,*.bak,*.o,tags,*.sess  " ignored files for expand, glob and autocompletion
set wildmenu                    " show a select menu for command suggestions
set wildmode=full

let g:is_posix=1                " POSIX shell scripts
let g:loaded_matchparen=1       " disable parenthesis hlight plugin
let g:is_bash=1                 " bash syntax the default for hlighting
let g:vimsyn_noerror=1          " hack for correct syntax hlighting

" TOHtml
let html_use_css=1              " use css classes to style the parts
let html_ignore_folding=1       " don't display colsed folds in html
let use_xhtml=1                 " generate valid xhtml

" vim-markdown
let g:vim_markdown_initial_foldlevel=2

" Commands:
"
" reload .vimrc-Configuration
command! -nargs=0 ConfigReload :source $MYVIMRC

" Make current file executeable
command! -nargs=0 Chmodx :silent !chmod +x %

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(':DiffOrig')
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" allow to easily toggle the quickfix window
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

" Keybindings:
"
" disable normalmode cursor keys to use always hjkl
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

" switch to previous/next buffer
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

" clear search register, useful if you want to get rid of too much highlighting
" nnoremap <silent> <leader>/ :let @/ = ""<CR>
nnoremap <silent> <Space> :noh<CR>

" little helper if a file was changed without root privilege
cmap w!! w !sudo tee % >/dev/null

" change default behavior to not start the search immediately
" have a look at :h restore-position
nnoremap <silent> * ms"zyiwHmt/\<<C-r>z\><CR>'tzt`s:let @"=@0<CR>
nnoremap <silent> # ms"zyiwHmt?\<<C-r>z\><CR>'tzt`s:let @"=@0<CR>

" insert absolute path of current filename, behavior is similar to normal mode mapping of <C-g>
" use <C-r>% to insert path from home
cnoremap <C-g> <C-r>=expand('%:p')<CR>

" insert trailing part of the path (the current filename without any leading directories
cnoremap <C-t> <C-r>=expand('%:t')<CR>

" compiler mappings
map  <F5> :mak<CR><ESC>
map! <F5> <ESC>:mak<CR><ESC>
map  <silent><F4> :QFix<CR>
map! <silent><F4> <ESC>:QFix<CR>

" insert the current date
nmap <Leader>D a<C-R>=strftime("%F %T")<CR><Esc>
imap <Leader>D <C-R>=strftime("%F %T")<CR>

" Plugin Configuration:
"
" fastwordcompleter
let g:fastwordcompleter_filetypes='txt,mail,c'
let g:fastwordcompletion_min_length=3

" csv.vim
let g:csv_highlight_column='y'
let g:csv_delim=','
let g:csv_nl=1

" vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor="pdflatex"
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_CompileRule_dvi='latex -interaction=nonstopmode $*'
let g:Tex_GotoError=0
let g:Tex_ViewRule_pdf='mupdf'

" netrw
let g:netrw_dirhistmax=0    " don't create directory history files .netrwhistory

" vimwiki options
let g:vimwiki_list = [{'path': $HOME.'/docs/wiki/local/source/',
    \ 'path_html': $HOME.'/docs/wiki/local/target/',
    \ 'auto_export': 0,
    \ 'index': 'index',
    \ 'template_path': $HOME.'/docs/wiki/local/theme/',
    \ 'template_default': 'template',
    \ 'template_ext': '.html',
    \ 'nested_syntaxes': {'sh_php': 'php', 'sh_vim': 'vim', 'sh_sh': 'sh'},
    \ 'maxhi': 0}]

let g:vimwiki_camel_case=0              " don't generate links from camelcase words
let g:vimwiki_list_ignore_newline=1     " don't use newline for <br /> in lists
let g:vimwiki_html_header_numbering=0   " disable header numbering
let g:vimwiki_browsers=['vimb']
let g:vimwiki_badsyms=' '               " remove spaces from file- and linknames
let g:vimwiki_dir_link='index'          " [[dir/][label]] -> dir/index.wiki

" clang
let g:clang_auto=0
let g:clang_c_options='-std=c11'

" vim-buffergator
let g:buffergator_suppress_keymaps=1
nmap <leader>b :BuffergatorToggle<CR>

" nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" Filetypes:
"
augroup filetypedetect
    au BufNewFile,BufRead */apache2/*,*/apache/*,*/httpd/* setfiletype apache
    au BufNewFile,BufRead COMMIT_EDITMSG set spell spl=en

    " catch all other filetypes as txt
    au BufWinEnter * if !exists('b:set_filetype') && strlen(&filetype) == 0 && bufname('%') != '' | setfiletype txt | endif | let b:set_filetype = 1
augroup END


" Abbreviations:
"
ab LH Lastenheft
ab MAG Magento
ab PH Pflichtenheft
ab PHPU PHPUnit-Test
ab SST Schnittstelle

let g:rehash256 = 1
colorscheme molokai
