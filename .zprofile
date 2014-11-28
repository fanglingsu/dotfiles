start_ssh_agent() {
  local ssh_env="$XDG_CACHE_HOME/ssh-env"

  if pgrep ssh-agent >/dev/null; then
    source "$ssh_env"
  else
    ssh-agent | grep -Fv echo > "$ssh_env"
    source "$ssh_env"
    ssh-add
  fi
}

start_ssh_agent
