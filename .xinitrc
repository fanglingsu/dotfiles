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
urxvtd -q -o -f
# syncronice clipoards
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# start automounting disk service
udiskie -qsN &

xbindkeys &
nm-applet &
urxvtc -e zsh -c "tmux attach || tmux -f $XDG_CONFIG_HOME/tmux/main attach -t main"

while true; do
    $HOME/bin/dwm-status
    sleep 2
done &
exec dwm &> /dev/null
