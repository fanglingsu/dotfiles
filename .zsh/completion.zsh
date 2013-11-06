# more extensive tab completion
autoload -Uz compinit
compinit

# allow completion from within a word/phrase
setopt COMPLETE_IN_WORD 

# when completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END   

#setopt correctall       # autocorrection

# completion style
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BKeine Treffer für: %d%b'
