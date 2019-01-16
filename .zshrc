# export other directories to PATH
export PATH=$PATH:$HOME/bin

# general settings
autoload -U colors && colors
unsetopt beep extendedglob notify
bindkey -e

setopt AUTO_CD

# directory hashes
hash -d vimb=~/code/c/vimb/
hash -d doc=~/docs/local/

# setup key accordingly
bindkey "^[[1;3D" backward-word # Alt-Left
bindkey "^[[1;3C" forward-word  # Alt-Right
[[ -n "${terminfo[khome]}" ]] && bindkey "${terminfo[khome]}" beginning-of-line     # Home
[[ -n "${terminfo[kend]}"  ]] && bindkey "${terminfo[kend]}"  end-of-line           # End
[[ -n "${terminfo[kich1]}" ]] && bindkey "${terminfo[kich1]}" overwrite-mode        # Insert
[[ -n "${terminfo[kdch1]}" ]] && bindkey "${terminfo[kdch1]}" delete-char           # Delete
[[ -n "${terminfo[kpp]}"   ]] && bindkey "${terminfo[kpp]}"   beginning-of-buffer-or-history    # PageUp
[[ -n "${terminfo[knp]}"   ]] && bindkey "${terminfo[knp]}"   end-of-buffer-or-history          # PageDown
[[ -n "${terminfo[kcbt]}"  ]] && bindkey "${terminfo[kcbt]}"  reverse-menu-complete # Shift-Tab

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

bindkey "\C-t" history-incremental-search-forward

# 10ms for key sequences
KEYTIMEOUT=1

# history
HISTFILE=$XDG_CACHE_HOME/zsh-history
HISTSIZE=SAVEHIST=10000

export HISTSIZE=10000
export SAVEHIST=$((HISTSIZE/2))
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY   # add comamnds as they are typed, don't wait until shell exit
setopt EXTENDED_HISTORY     # include more information about when the command was executed, etc
setopt HIST_NO_FUNCTIONS    # do not store function definitions in the history list
setopt SHARE_HISTORY        # share history between zsh processes
setopt APPEND_HISTORY       # allow multiple terminal sessions to all append to one zsh command history

# completion
fpath=(~/.config/zsh/completion $fpath)
autoload -U compinit
compinit

setopt COMPLETE_IN_WORD     # allow completion from within a word/phrase
setopt ALWAYS_TO_END

# allow also completion of aliases
setopt complete_aliases
_expand_alias_and_complete() {
    if [[ -o complete_aliases && -n $aliases[$words[1]] ]]; then
        words[1]=($aliases[$words[1]])
        _complete
    else
        return 1
    fi
}
zstyle ':completion:*' completer _complete _expand_alias_and_complete

# completion style
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:warnings' format '%Bno match for: %d%b'

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;34'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes-names' command  'ps c -u $USER -o command | uniq'

# prompt
source $XDG_CONFIG_HOME/zsh/git-prompt/zshrc.sh

add-zsh-hook precmd precmd_build_prompt
function precmd_build_prompt() {
    PROMPT="%{$fg[cyan]%}%m%{$fg[blue]%} %5~ %{$fg[yellow]%}%(0?..%?)%{$reset_color%}$(git_super_status)$ "
}

# hooks
# set window title for different terminals
add-zsh-hook preexec preexec_print_title
add-zsh-hook precmd precmd_print_title

function preexec_print_title() {
    case $TERM in
        *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
            print -Pn "\e]0;zsh %~ ($1)\a"
            ;;
    esac
}

function precmd_print_title() {
    case $TERM in
        *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
            print -Pn "\e]0;zsh %~\a"
            ;;
    esac
}

# bindkeys
bindkey "\e\e[D" backward-word  # move a word backward with <alt>-<left>
bindkey "\e\e[C" forward-word   # move a word forward with <alt>-<right>

# aliases
if [[ -x "`whence -p dircolors`" ]]; then
    eval `dircolors`
    alias ls='ls --color=auto --si'
    alias grep='grep --color=auto'
fi

alias -g L='|less'
alias -g G='|grep'

alias ll='ls -l --group-directories-first --time-style=long-iso'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias less='less -imR'
alias vless='vim -u /usr/share/vim/vim7?/macros/less.vim --cmd "source ~/.vimrc" -n'
alias bell='echo -e "\007"'
alias weather="curl -s wttr.in/jena | head -n -3"
alias history='fc -lDi'

alias tt="timetrack"

alias orphans="pacman -Qtdq"
alias pacup="sudo pacman -Syu"
alias newident="sudo pkill --signal SIGHUP -x tor"
alias torvimb='torify vimb -c $XDG_CONFIG_HOME/vimb/tor'
alias mycommits='git log --all --reverse --full-history --since="8 hours ago" --author="`git config user.name`" --pretty=format:"%s" | sed -e "s/ (#.*$//;s/\.$//;\$a\\"'

# custom completions
compdef _gnu_generic phpunit
compdef _gnu_generic mage
compdef _gnu_generic mage-model
compdef _gnu_generic mage-module
compdef _gnu_generic mage-grid
compdef _gnu_generic mage-code-review
compdef _gnu_generic time-extract
