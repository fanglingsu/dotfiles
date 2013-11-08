" Plugin Configuration:
" ---------------------
 
" NERDTree config
let g:NERDTreeBookmarksFile = $HOME.'/.vim/nerdtree-bookmarks'
"let g:NERDTreeIgnore = ['\.pyc$', '\~$']
let NERDTreeHijackNetrw=0 " do not use nerdtree for dirlist

" twiki syntax highlighting and folding
let g:Twiki_FoldAtHeadings=2
let g:Twiki_SourceHTMLSyntax=1
let g:Twiki_Functions=1
let g:Twiki_Mapings=1

" snipmate config
let g:snips_author="Daniel Carl"

" TOHtml
let html_use_css=1          " use css classes to style the parts
let html_ignore_folding=1   " don't display colsed folds in html
let use_xhtml=1             " generate valid xhtml

" vimwiki options
let g:vimwiki_list = [{'path': '~/docs/wiki/local/source/',
    \ 'path_html': '~/docs/wiki/local/target/',
    \ 'auto_export': 0, 
    \ 'index': 'index',
    \ 'template_path': '~/docs/wiki/local/theme/',
    \ 'template_default': 'template',
    \ 'template_ext': '.html',
    \ 'nested_syntaxes': {'sh_php': 'php', 'sh_vim': 'vim', 'sh_sh': 'sh'},
    \ 'maxhi': 0},
    \ {'path': '~/docs/wiki/fls/source/',
    \ 'ext': '.wiki',
    \ 'path_html': $HOME.'/docs/wiki/fls/target/',
    \ 'auto_export': 0, 
    \ 'index': 'index',
    \ 'template_path': $HOME.'/docs/wiki/fls/theme/',
    \ 'template_default': 'template',
    \ 'template_ext': '.html',
    \ 'css_name': 'theme/css/main.css',
    \ 'nested_syntaxes': {'sh_php': 'php', 'sh_vim': 'vim', 'sh_sh': 'sh'},
    \ 'maxhi': 0}]

let g:vimwiki_camel_case=0              " don't generate links from camelcase words
let g:vimwiki_list_ignore_newline=1     " don't use newline for <br /> in lists
let g:vimwiki_html_header_numbering=0   " disable header numbering
let g:vimwiki_browsers=['vimprobable2', 'firefox']
let g:vimwiki_badsyms = ' '             " remove spaces from file- and linknames
let g:vimwiki_dir_link = 'index'        " [[dir/][label]] -> dir/index.wiki

" fastwordcompleter
let g:fastwordcompleter_filetypes = 'txt'
let g:fastwordcompletion_min_length = 3

" php-indent
:let g:PHP_vintage_case_default_indent = 1

" csv-vim
:let g:csv_delim=','                    " set delimiter to ,
:let g:csv_highlight_column = 'y'       " highlight columns automatic

" utl_rc
let g:utl_cfg_hdl_scm_http_system = "silent ! vimprobable2 %u &"

" fuzzyfinder
nmap <Leader>fb     :FufBuffer<CR>
nmap <Leader>ff     :FufFile<CR>
nmap <Leader>fd     :FufDir<CR>
nmap <Leader>ft     :FufTag<CR>
nmap <Leader>fh     :FufHelp<CR>
nmap <Leader>fl     :FufLine<CR>

" csv.vim
let g:csv_highlight_column = 'y'
let g:csv_delim = ','

" vim-latex
"let g:tex_flavor = "pdflatex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'mupdf'

" vim-orgmode
let g:org_agenda_files=['~/docs/org/index.org']
