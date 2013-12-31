export LANG=de_DE.UTF-8
# POSIX_ME_HARDER
#export POSIXLY_CORRECT=1
export EDITOR=vim
export PAGER=less
export BROWSER=vimb

# setup default dirs
[ "$XDG_CONFIG_HOME" ] || export XDG_CONFIG_HOME="$HOME/.config"
[ "$XDG_CACHE_HOME" ]  || export XDG_CACHE_HOME="$HOME/.cache"
[ "$XDG_DATA_HOME" ]   || export XDG_DATA_HOME="$HOME/.local/share"

# by default: export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# we take out the slash, period, angle brackets, dash here.
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# fix for missscaled java gui interfaces with grey blobs around
# http://www.haskell.org/haskellwiki/Xmonad/Frequently_asked_questions#Problems_with_Java_applications.2C_Applet_java_console
export _JAVA_AWT_WM_NONREPARENTING=1

# config for the git-promt
export ZSH_THEME_GIT_PROMPT_NOCACHE=1

# indentation for xmllint
export XMLLINT_INDENT="    "

export http_proxy=http://127.0.0.1:8118/

export TDL_DATABASE=~/.tdldb

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0111111"
    echo -en "\e]P8555753"
    echo -en "\e]P1d15517"
    echo -en "\e]P9EF2929"
    echo -en "\e]P24E9A06"
    echo -en "\e]PA8AE234"
    echo -en "\e]P3C4A000"
    echo -en "\e]PBFCE94F"
    echo -en "\e]P43465A4"
    echo -en "\e]PC729FCF"
    echo -en "\e]P575507B"
    echo -en "\e]PDAD7FA8"
    echo -en "\e]P606989A"
    echo -en "\e]PE34E2E2"
    echo -en "\e]P7D3D7CF"
    echo -en "\e]PFEEEEEC"
    clear # bring us back to default input colours
fi

umask 027
