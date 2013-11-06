# little print out helper for colorized output.
# Print output to stderr so we can use the stdout
# for some fancy things too.

source colors.sh

function die() {
    local message="$1"
    local exitCode=$2
    echo "$message"
    [ "$exitCode" == "" ] && exit 1 || exit $exitCode
}

# prints given string as message head before a block of messages.
#
# @param string
function message_head() {
    echo -e "$CEW${1}:$CDEF" >&2
}

# prints given string as failure message.
#
# @param string
function write_error() {
    echo -e "    [${CR}FAIL$CDEF]  $1" >&2
}

# prints given string as debug message.
#
# @param string
function write_info() {
    echo -e "    [${CY}INFO$CDEF]  $1" >&2
}

# prints given string as success message.
#
# @param string
function write_success() {
    echo -e "    [${CG}DONE$CDEF]  $1" >&2
}

# prints given string as debug message if debugg output is allowed
#
# @param string
function write_debug() {
    if [ "$DEBUG" != "" ] ; then
        echo -e "    [${CC}DEBUG$CDEF] $1" >&2
    fi
}
