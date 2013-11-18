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
    echo -en "\e]P0111111"
    echo -en "\e]P8666666"
    echo -en "\e]P1d15517"
    echo -en "\e]P9d11723"
    echo -en "\e]P236b217"
    echo -en "\e]PA00d56a"
    echo -en "\e]P3d1b217"
    echo -en "\e]PBffea55"
    echo -en "\e]P455aaff"
    echo -en "\e]PC1793d1"
    echo -en "\e]P5b217d1"
    echo -en "\e]PDd11793"
    echo -en "\e]P693d1b2"
    echo -en "\e]PE17d1b2"
    echo -en "\e]P7aaaaaa"
    echo -en "\e]PFffffff"
    clear # bring us back to default input colours
fi
