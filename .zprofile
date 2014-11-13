envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval `cat "$envfile"`
else
    eval `gpg-agent --daemon --enable-ssh-support -s --write-env-file "$envfile"`
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh
export SSH_AGENT_PID
export GPG_TTY=$(tty)

# tell gpg-agent wich startup terminal to use for ssh
echo UPDATESTARTUPTTY | gpg-connect-agent &>/dev/null
