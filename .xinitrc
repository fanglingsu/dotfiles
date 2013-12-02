if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
xrdb -merge $HOME/.Xresources

xsetroot -solid black
xsetroot -cursor_name left_ptr
xset +fp /usr/share/fonts/local
xset fp rehash
# fix for broken java windows in dwm
#wmname LG3D

unclutter -noevents -idle 2 &

# start urxvt deamon and a single client
/usr/bin/urxvtd -q -o -f

eval $(/usr/bin/gpg-agent --daemon) &

# clipboard synching
/usr/bin/autocutsel -fork &
/usr/bin/autocutsel -selection PRIMARY -fork &

# start automounting disk service
/usr/bin/udiskie -s &

/usr/bin/urxvtc -e screen -d -RR &
while true; do
    $HOME/bin/dwm-status
    sleep 2
done &
exec dwm > /dev/null 2>&1
