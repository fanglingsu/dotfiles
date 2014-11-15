/usr/bin/keychain -Q -q --nogui id_rsa $GPGKEY
[[ -z $HOSTNAME ]] && HOSTNAME=$(uname -n)
[[ -f $HOME/.keychain/${HOSTNAME}-sh ]] && source "$HOME/.keychain/${HOSTNAME}-sh"
[[ -f $HOME/.keychain/${HOSTNAME}-sh-gpg ]] && source "$HOME/.keychain/${HOSTNAME}-sh-gpg"
