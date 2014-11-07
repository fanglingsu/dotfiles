eval `/usr/bin/keychain -Q -q --nogui --eval id_rsa $GPGKEY`
[[ -f $HOME/.keychain/${HOSTNAME}-sh ]] && source $HOME/.keychain/${HOSTNAME}-sh
[[ -f $HOME/.keychain/${HOSTNAME}-sh-gpg ]] && source $HOME/.keychain/${HOSTNAME}-sh-gpg
