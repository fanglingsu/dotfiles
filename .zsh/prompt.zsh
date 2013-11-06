source ~/.zsh/git-prompt/zshrc.sh

add-zsh-hook precmd precmd_build_prompt
function precmd_build_prompt() {
    PROMPT="%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[yellow]%}%m:%{$fg[green]%}%4~%{$reset_color%}$(git_super_status)$ "
}
