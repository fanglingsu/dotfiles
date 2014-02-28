#!/usr/bin/env sh

xidfile="$HOME/.vimb.xid"
uri=""

if [ "$#" -gt 0 ]; then
	uri="$1"
fi

runtabbed() {
	tabbed -dn tabbed-vimb -r 2 vimb -e '' "$uri" \
        > "$xidfile" 2>/dev/null &
}

if [ ! -r "$xidfile" ]; then
	runtabbed
else
	xid=$(cat "$xidfile")
	xprop -id "$xid" >/dev/null 2>&1
	if [ $? -gt 0 ]; then
		runtabbed
	else
		vimb -e "$xid" "$uri" >/dev/null 2>&1 &
	fi
fi
