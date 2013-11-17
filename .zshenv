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
#export ZSH_THEME_GIT_PROMPT_NOCACHE=1

# indentation for xmllint
export XMLLINT_INDENT="    "

export http_proxy=http://127.0.0.1:8118/

export TDL_DATABASE=~/.tdldb

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P8777777" #darkgrey
    echo -en "\e]P1ff5555" #darkred
    echo -en "\e]P9ff8888" #red
    echo -en "\e]P255ff55" #darkgreen
    echo -en "\e]PA88ff88" #green
    echo -en "\e]P3ffff55" #darkyellow
    echo -en "\e]PBffff88" #yellow
    echo -en "\e]P46666ff" #darkblue
    echo -en "\e]PC9999ff" #blue
    echo -en "\e]P5ff55ff" #darkmagenta
    echo -en "\e]PDff88ff" #magenta
    echo -en "\e]P655ffff" #darkcyan
    echo -en "\e]PE88ffff" #cyan
    echo -en "\e]P7eeeeee" #lightgrey
    echo -en "\e]PFffffff" #white
    clear # bring us back to default input colours
fi
