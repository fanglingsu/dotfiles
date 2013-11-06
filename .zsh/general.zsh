autoload -U colors && colors
unsetopt beep extendedglob notify
bindkey -e

#zstyle :compinstall filename '/home/daniel/.zshrc'
# if you type foo, and it isn't a command, and it is a directory in your cdpath, go there

setopt AUTO_CD
hash -d vimb=/home/daniel/code/c/vimb/
