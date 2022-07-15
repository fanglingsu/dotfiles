#!/usr/bin/env bash
BASE_URL=""
CONCURRENT_PROCESSE=3
SLEEP_SECONDS=60

source functions.sh

show_help() {
    cat >&2 << EOM
USAGE:   $(basename $0) [OPTIONS]

Checks age Header in HTTP Responses
for paths given as lines from stdin.

OPTIONS:
   -b BASE_URL  Base-URL
   -c N         Request concurrency (default $CONCURRENT_PROCESSE).
   -s N         Number os seconds to sleep between the request
                bunches (default $SLEEP_SECONDS).
   -h           Show this help
EOM
}

# check the cache age of given url suffix
check() {
    local uri="$1"
    local time="$(date +%T)"
    local age="$(
        curl -s -o /dev/null -XHEAD -A 'Cache Age Checker' -D - "$BASE_URL${uri}" | \
        sed -n '/^age: /s/.*: //p'
    )"
    printf "%s\t%s\t%s\n" "$uri" "$time" "$age"
}

export BASE_URL
export -f check

while getopts "b:c:hs:" args; do
    case "$args" in
        b)  BASE_URL="$OPTARG" ;;
        c)  CONCURRENT_PROCESSE="$OPTARG" ;;
        h)  echo "$(show_help)"
            exit 1 ;;
        s)  SLEEP_SECONDS="$OPTARG" ;;
        \?) echo "$(show_help)"
            exit 1 ;;
    esac
done

if [ -z "$BASE_URL" ]; then
    echo "Missing base url" >&2
    die "$(show_help)" 2
fi

# generate some header information about the measurment
cat << EOF
---
date:     $(date +%x)
base url: $BASE_URL
---
EOF

# read url paths from stdin into array
urls=()
while IFS= read -r line
do
    urls+=("$line")
done
while true; do
    parallel -k -j "$CONCURRENT_PROCESSE" check ::: ${urls[@]}
    sleep "$SLEEP_SECONDS"
done
