" Keybindings:
" ------------

" disable normalmode cursor keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

" switch to previous/next buffer
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>

" clear search register, useful if you want to get rid of too much highlighting
" nnoremap <silent> <leader>/ :let @/ = ""<CR>
nmap <silent> <leader>/ :nohlsearch<CR>

" little helper if a file was changed without root privilege
" cmap wsudo w !sudo tee % >/dev/null

" change default behavior to not start the search immediately
" have a look at :h restore-position
nnoremap <silent> * ms"zyiwHmt/\<<C-r>z\><CR>'tzt`s:let @"=@0<CR>
nnoremap <silent> # ms"zyiwHmt?\<<C-r>z\><CR>'tzt`s:let @"=@0<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

map <buffer>   <C-K>         <C-]>

" insert absolute path of current filename, behavior is similar to normal mode mapping of <C-g>
" use <C-r>% to insert path from home
cnoremap <C-g> <C-r>=expand('%:p')<CR>

" insert trailing part of the path (the current filename without any leading directories
cnoremap <C-t> <C-r>=expand('%:t')<CR>

" config for the nerdtree
map  <silent><F7> :NERDTreeToggle<CR><ESC>
map! <silent><F7><ESC> :NERDTreeToggle<CR><ESC>

" config for Tlist
map  <silent><F8> :TlistToggle<CR>
map! <silent><F8><ESC> :TlistToggle<CR><ESC>

" compiler mappings
map  <F5> :mak<CR><ESC>
map! <F5> <ESC>:mak<CR><ESC>
map  <silent><F4> :call l9#quickfix#toggleWindow()<CR>
map! <silent><F4> <ESC>:call l9#quickfix#toggleWindow()<CR>

" insert the current date
nmap <Leader>D a<C-R>=strftime("%F %T")<CR><Esc>
imap <Leader>D <C-R>=strftime("%F %T")<CR>
