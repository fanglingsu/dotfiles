" Vim Addon Manager:
" ------------------

if exists("g:vimrc_plugins_loaded")
    finish
endif
let g:vimrc_plugins_loaded = 1

call pathogen#infect()
call ipi#inspect()

filetype plugin indent on
