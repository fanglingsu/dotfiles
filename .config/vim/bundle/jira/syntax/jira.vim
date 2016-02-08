runtime! syntax/html.vim
if exists('b:current_syntax')
    unlet b:current_syntax
endif
let b:current_syntax = "jira"
syn case ignore
syn sync linebreaks=1

"additions to HTML groups
syn region htmlBold start="\*\ze\S" end="\S\zs\*" keepend
syn region htmlItalic start="_\ze\S" end="\S\zs_" keepend

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

syn region jiraNoFormat matchgroup=hide start="{noformat}" end="{noformat}" keepend
syn region jiraPanel start="{panel:" end="{panel}" fold contains=ALL keepend
syn region jiraPanelTitle matchgroup=hide start="{panel:.\{-}\(title=\)" end="}\||" contained 
syn match  jiraPanelEnd /{panel}/ contained

hi jiraMarkOn ctermfg=yellow
hi jiraMarkOff ctermfg=darkgrey
hi jiraMarkCheck ctermfg=green
hi jiraMarkError ctermfg=red
hi jiraMarkWarn ctermfg=LightYellow
hi jiraMarkInfo ctermfg=blue
hi link jiraPanelTitle Identifier
hi link jiraPanel hide
hi link jiraPanelEnd hide
