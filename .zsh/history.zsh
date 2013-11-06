HISTFILE=~/.histfile
HISTSIZE=SAVEHIST=10000

# remove superfluous blanks from each command line being added to the history list
setopt HIST_REDUCE_BLANKS

# do not enter command lines into the history list if any command on the line begins with a blank
setopt HIST_IGNORE_SPACE

# share history between zsh processes
setopt SHARE_HISTORY

# do not store function definitions in the history list
setopt HIST_NO_FUNCTIONS

# allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY 

# add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY 

# do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_DUPS

# when searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

