# export other directories to PATH
export PATH=$PATH:$HOME/bin

umask 027

# general settings
autoload -U colors && colors
unsetopt beep extendedglob notify
bindkey -e

setopt AUTO_CD

# directory hashes
hash -d vimb=$HOME/code/c/vimb/

# create a zkbd compatible hash
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

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

# history
HISTFILE=$XDG_CACHE_HOME/zsh-history
HISTSIZE=SAVEHIST=10000

export GPGKEY=0E6CBB5C
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
autoload -Uz compinit
compinit


setopt COMPLETE_IN_WORD     # allow completion from within a word/phrase
setopt ALWAYS_TO_END

# completion style
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BKeine Treffer für: %d%b'

# prompt
source $XDG_CONFIG_HOME/zsh/git-prompt/zshrc.sh

add-zsh-hook precmd precmd_build_prompt
function precmd_build_prompt() {
    PROMPT="%{$fg[cyan]%}%m%{$fg_bold[blue]%} %5~ %{$fg_no_bold[yellow]%}%(0?..%?)%{$reset_color%}$(git_super_status)$ "
#    PROMPT="┌─[%{$fg[cyan]%}%m%{$fg_bold[blue]%} %~ %{$fg_no_bold[yellow]%}%(0?..%?)%{$reset_color%}$(git_super_status)]
#└─╼ "
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

        screen)
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
            ;;
    esac
}

function precmd_print_title() {
    case $TERM in
        *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
            print -Pn "\e]0;zsh %~\a"
            ;;

        screen)
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;$TERM - (%L) zsh %~\a"
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

alias ll='ls -l --group-directories-first'
alias la='ls -A'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias less='less -imR'

alias wifi="wicd-curses"

alias orphans="pacman -Qtdq"
alias pacup="sudo pacman -Syu"
alias newident="sudo pkill --signal SIGHUP -x tor"
alias torvimb='torify vimb -c $XDG_CONFIG_HOME/vimb/tor'
