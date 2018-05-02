#!/usr/bin/env sh

xidfile="$HOME/.vimb.xid"
options="$@"

runtabbed() {
    tabbed -dkn tabbed-vimb -r 2 vimb -e '' $options > "$xidfile" 2>/dev/null &
}

if [ ! -r "$xidfile" ]; then
    runtabbed
else
    xid=$(cat "$xidfile")
    # check if the window with the xid still exists
    # and is a tabbed window
    xprop -id "$xid" -notype WM_CLASS | grep -q '"tabbed"'
    if [ $? -gt 0 ]; then
        runtabbed
    else
        vimb -e "$xid" $options >/dev/null 2>&1 &
    fi
fi
