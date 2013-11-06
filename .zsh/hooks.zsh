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
