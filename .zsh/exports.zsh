export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/daniel/bin
export LANG=de_DE.UTF-8
# POSIX_ME_HARDER
export POSIXLY_CORRECT=1
export EDITOR=vim
export PAGER=less
export BROWSER=vimp
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
