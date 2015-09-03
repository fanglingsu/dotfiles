# Declaring escape sequences for colorize bash output.
#
# usage:
# echo -e $CBläläl$CDEF

if [[ -t 1 ]]; then
    # regular colors
    CK="\e[0;30m"    # black
    CR="\e[0;31m"    # red
    CG="\e[0;32m"    # green
    CY="\e[0;33m"    # yellow
    CB="\e[0;34m"    # blue
    CM="\e[0;35m"    # magenta
    CC="\e[0;36m"    # cyan
    CW="\e[0;37m"    # white

    # emphasized (bolded) colors
    CEK="\e[1;30m"
    CER="\e[1;31m"
    CEG="\e[1;32m"
    CEY="\e[1;33m"
    CEB="\e[1;34m"
    CEM="\e[1;35m"
    CEC="\e[1;36m"
    CEW="\e[1;37m"

    # background colors
    CBGK="\e[40m"
    CBGR="\e[41m"
    CBGG="\e[42m"
    CBGY="\e[43m"
    CBGB="\e[44m"
    CBGM="\e[45m"
    CBGC="\e[46m"
    CBGW="\e[47m"

    CDEF="\e[0m" # default color
else
    CK=""
    CR=""
    CG=""
    CY=""
    CB=""
    CM=""
    CC=""
    CW=""
    CEK=""
    CER=""
    CEG=""
    CEY=""
    CEB=""
    CEM=""
    CEC=""
    CEW=""
    CBGK=""
    CBGR=""
    CBGG=""
    CBGY=""
    CBGB=""
    CBGM=""
    CBGC=""
    CBGW=""
    CDEF=""
fi
