#/usr/bin/keychain -Q -q --nogui id_rsa $GPGKEY
eval `/usr/bin/keychain --eval id_rsa $GPGKEY`
[[ -f $HOME/.keychain/${HOSTNAME}-sh ]] && source $HOME/.keychain/${HOSTNAME}-sh
[[ -f $HOME/.keychain/${HOSTNAME}-sh-gpg ]] && source $HOME/.keychain/${HOSTNAME}-sh-gpg
