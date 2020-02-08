export LANG=de_DE.UTF-8
# POSIX_ME_HARDER
#export POSIXLY_CORRECT=1
export EDITOR=vim
export PAGER="less -iMR"
export BROWSER=vimb
export GPGKEY=0x3CA285230E6CBB5C
export QUOTING_STYLE="literal"
export MYSQL_HISTIGNORE='EXPLAIN*:DELETE*'
export GREP_COLORS="mt=01;32:ms=01;32:mc=01;32:sl=:cx=:fn=35:ln=32:bn=32:se=36"
export LESSCHARSET=UTF-8
export _JAVA_AWT_WM_NONREPARENTING=1
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export FD_OPTIONS="--follow --exclude .git"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ -d {} ]] && tree -L 2 -C {} | head -200 || [[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat -p --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='?:toggle-preview' --bind='ctrl-d:half-page-down' --bind='ctrl-u:half-page-up' --bind='ctrl-a:select-all+accept' --bind='ctrl-j:preview-down' --bind='ctrl-k:preview-up'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_ALT_C_OPTS="--preview 'tree -L 2 -C {} | head -200'"

# setup default dirs
[ "$XDG_CONFIG_HOME" ] || export XDG_CONFIG_HOME="$HOME/.config"
[ "$XDG_CACHE_HOME" ]  || export XDG_CACHE_HOME="$HOME/.cache"
[ "$XDG_DATA_HOME" ]   || export XDG_DATA_HOME="$HOME/.local/share"

# data directory for password manager
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PASSWORD_STORE_CLIP_TIME=15

# by default: export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# we take out the slash, period, angle brackets, dash here.
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# config for the git-promt
export ZSH_THEME_GIT_PROMPT_NOCACHE=1

# indentation for xmllint
export XMLLINT_INDENT="    "

if [ "$TERM" = "linux" ]; then
    # 8 normal colors
    echo -en "\e]P0111111"
    echo -en "\e]P1CC0000"
    echo -en "\e]P24E9A06"
    echo -en "\e]P3C4A000"
    echo -en "\e]P43465A4"
    echo -en "\e]P575507B"
    echo -en "\e]P606989A"
    echo -en "\e]P7D3D7CF"

    # 8 bright colors
    echo -en "\e]P8555753"
    echo -en "\e]P9EF2929"
    echo -en "\e]PA8AE134"
    echo -en "\e]PBFCE94F"
    echo -en "\e]PC729FCF"
    echo -en "\e]PDAD7FA8"
    echo -en "\e]PE34E2E2"
    echo -en "\e]PFEEEEEC"
    clear # bring us back to default input colours
fi

# See https://superuser.com/questions/852912/
# killall -USR1 zsh
TRAPUSR1() {
    if [[ -o INTERACTIVE ]]; then
        {echo; echo execute a new shell instance } 1>&2
        exec zsh
    fi
}
