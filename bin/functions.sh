# little print out helper for colorized output.
# Print output to stderr so we can use the stdout
# for some fancy things too.

source colors.sh

die() {
    local message="$1"
    local exitCode=$2
    echo "$message"
    [ "$exitCode" == "" ] && exit 1 || exit $exitCode
}

# prints given string as message head before a block of messages.
#
# @param string
message_head() {
    echo -e "$CEW${1}:$CDEF" >&2
}

# prints given string as failure message.
#
# @param string
write_error() {
    echo -e "    [${CR}FAIL$CDEF]  $1" >&2
}

# prints given string as debug message.
#
# @param string
write_info() {
    echo -e "    [${CY}INFO$CDEF]  $1" >&2
}

# prints given string as success message.
#
# @param string
write_success() {
    echo -e "    [${CG}DONE$CDEF]  $1" >&2
}

# prints given string as debug message if debugg output is allowed
#
# @param string
write_debug() {
    if [ "$DEBUG" != "" ]; then
        echo -e "    [${CC}DEBUG$CDEF] $1" >&2
    fi
}

action_start() {
	local msg="$1"
	local len=${#msg}
	if [ $len -gt 57 ]; then
		len=57
	fi
	printf "$CEB:: $CEW%.*s... $CDEF" $len "$msg" >&2
}

action_status() {
	local msg="[$1]"
	local maxcol=$(tput cols)
	if [ $maxcol -gt 70 ]; then
		maxcol=70
	fi

	# move cursor to beginning of line
	echo -ne "\r"
	tput cuf $(($maxcol-${#msg}))
    printf "%s\n" "$msg" >&2
}
