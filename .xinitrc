xrdb -merge ~/.Xdefaults
xsetroot -solid black
xsetroot -cursor_name left_ptr
# fix for broken java windows in dwm
wmname LG3D

unclutter -idle 1 -root&
# start urxvt deamon and a single client
exec urxvtcd -e screen -d -RR &
dwm-status | while read line; do 
    xsetroot -name "$line";
done & 
exec VBoxClient-all &
exec dwm > /dev/null 2>&1
