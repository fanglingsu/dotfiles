if [[ -x "`whence -p dircolors`" ]]; then
    eval `dircolors`
    alias ls='ls --color=auto'
    alias grep='grep --color=always'
fi

alias ll='ls -l --group-directories-first'
alias la='ls -A'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias less='less -imR'

# relate some file types to programms
# alias -s html=$BROWSER
# alias -s php=$EDITOR
# alias -s txt=$EDITOR
# alias -s vim=$EDITOR

alias -g L='|less'
alias -g G='|grep'

# alias mv='nocorrect mv'       # no typo correction
# alias cp='nocorrect cp'       # no typo correction
# alias mkdir='nocorrect mkdir' # no typo correction

hash -d vimb=/home/daniel/code/c/vimb
