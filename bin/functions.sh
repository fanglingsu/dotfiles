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
    action_message "$1"

    shift
    # Execute the command and check the return value
    "$@"
    local res=$?
    action_status $res
    return $res
}

# prints the action message.
action_message() {
    local msg="$1"
    local len=${#msg}
    if [ $len -gt 71 ]; then
        len=71
    fi
    # print the message first.
    printf "$CEB:: $CDEF%.*s... " $len "$msg" >&2
}

# print the action status label on the right of the action message.
action_status() {
    local state=$1
    local maxcol=$(tput cols)
    if [ $maxcol -gt 78 ]; then
        maxcol=78
    fi
    # Determine the label to show.
    local label="DONE"
    if [ $state -gt 0 ]; then
        label="FAIL"
    fi
    
    # Move cursor to beginning of line.
    echo -ne "\r"
    # Move forward to the point the label should start.
    tput cuf $((${maxcol}-${#label}-2))

    # Print the colored labe.
    if [ $state -eq 0 ]; then
        echo -e "[${CG}$label${CDEF}]" >&2
    else
        echo -e "[${CR}$label${CDEF}]" >&2
    fi
}
