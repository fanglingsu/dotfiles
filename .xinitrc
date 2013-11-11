xrdb -merge ~/.Xdefaults
xsetroot -solid black
xsetroot -cursor_name left_ptr
xset +fp /usr/share/fonts/local
xset fp rehash
# fix for broken java windows in dwm
#wmname LG3D

#unclutter -idle 1 -root&
# start urxvt deamon and a single client
/usr/bin/urxvtd -q -o -f
/usr/bin/urxvtc -e screen -d -RR &
sleep 7 && conky -q | while read line; do 
    xsetroot -name "$line";
done & 
exec dwm > /dev/null 2>&1
