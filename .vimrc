" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

source $HOME/.vim/addons.vim
source $HOME/.vim/keybindings.vim
source $HOME/.vim/commands.vim
source $HOME/.vim/global.vim
source $HOME/.vim/pluginconfig.vim
source $HOME/.vim/filetype.vim
source $HOME/.vim/abbreviation.vim
