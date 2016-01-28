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

action() {
	local msg="$1"
	local len=${#msg}
	if [ $len -gt 57 ]; then
		len=57
	fi
	# Print the message first.
	printf "$CEB:: $CDEF%.*s... " $len "$msg" >&2

	shift
	# Execute the command and ceck the return value
	"$@" && _action_status "${CG}DONE$CDEF" || _action_status "${CR}FAIL$CDEF"
	return $?
}

_action_status() {
	local label="[$1]"
    local msg="$2"
	local maxcol=$(tput cols)
	if [ $maxcol -gt 70 ]; then
		maxcol=70
	fi

	# move cursor to beginning of line
	echo -ne "\r"
	tput cuf $(($maxcol-${#label}))
    if [[ $msg ]]; then
        echo -ne "$label\n   $msg\n" >&2
    else
        echo -e "$label" >&2
    fi
}
