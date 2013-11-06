" Commands:
" ---------

" reload .vimrc-Configuration
command! ConfigReload :source $MYVIMRC|echo "Configuration reloaded"

" Make current file executeable
command! -nargs=0 Chmodx :silent !chmod +x %

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(':DiffOrig')
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
