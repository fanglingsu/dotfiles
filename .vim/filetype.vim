" Filetype detection defaults:
" ----------------------------

if exists("did_load_filetypes_userafter")
    finish
endif
let did_load_filetypes_userafter = 1

augroup filetypedetect
    au BufNewFile,BufRead */apache2/*,*/apache/*,*/httpd/* setfiletype apache
    au BufNewFile,BufRead COMMIT_EDITMSG set spell spelllang=en

    " catch all other filetypes as txt
    au BufWinEnter * if !exists('b:set_filetype') && strlen(&filetype) == 0 && bufname('%') != '' | setfiletype txt | endif | let b:set_filetype = 1
augroup END
