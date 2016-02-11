runtime! syntax/html.vim
if exists('b:current_syntax')
    unlet b:current_syntax
endif
let b:current_syntax = "jira"
syn case ignore
syn sync linebreaks=1

"additions to HTML groups
syn region htmlItalic start="_\ze\S_" end="\S\zs_" keepend oneline
syn region htmlBold start="\*\ze\S" end="\S\zs\*" keepend oneline
syn region htmlBoldItalic start="*_\ze\S" end="\S\zs_\*" keepend oneline
syn region htmlBoldItalic start="_\*\ze\S" end="\S\zs\*_" keepend oneline

"HTML headings
syn region htmlH1 start="^h1.\s*" end="$" contains=@Spell
syn region htmlH2 start="^h2.\s*" end="$" contains=@Spell
syn region htmlH3 start="^h3.\s*" end="$" contains=@Spell
syn region htmlH4 start="^h4.\s*" end="$" contains=@Spell
syn region htmlH5 start="^h5.\s*" end="$" contains=@Spell
syn region htmlH6 start="^h6.\s*" end="$" contains=@Spell

syn match jiraMarkOn    /(on)/  " conceal cchar=⚙
syn match jiraMarkOff   /(off)/ " conceal cchar=⚪
syn match jiraMarkCheck /(\/)/  " conceal cchar=✔
syn match jiraMarkError /(x)/
syn match jiraMarkWarn  /(!)/   " conceal cchar=!
syn match jiraMarkInfo  /(?)/

syn region jiraNoFormat start="{noformat}" end="{noformat}" fold keepend
syn region jiraPanel start="{panel:" end="{panel}" fold contains=ALL keepend
syn region jiraPanelTitle matchgroup=hide start="{panel:.\{-}\(title=\)" end="}\||" contained
syn match  jiraPanelEnd /{panel}/ contained

syn region jiraCode oneline start="\(^\|\([,. ?!()[\]{}:;\-]\|$\)\)\zs{{\%({{\)\@!" end="}}\ze\([,. ?!()[\]{}:;\-]\|$\)"

hi jiraMarkOn ctermfg=yellow
hi jiraMarkOff ctermfg=darkgrey
hi jiraMarkCheck ctermfg=green
hi jiraMarkError ctermfg=red
hi jiraMarkWarn ctermfg=LightYellow
hi jiraMarkInfo ctermfg=blue

hi link jiraCode        String
hi link jiraPanelTitle  Identifier
hi link jiraNoFormat    String
hi link jiraPanel       hide
hi link jiraPanelEnd    hide
