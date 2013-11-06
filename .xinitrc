xrdb -merge ~/.Xdefaults
xsetroot -solid black
xsetroot -cursor_name left_ptr

unclutter -idle 1 -root&
# start urxvt deamon and a single client
exec urxvtcd -e screen -d -RR &
sleep 7 && conky -q | while read line; do 
    xsetroot -name "$line";
done & 
exec dwm > /dev/null 2>&1
