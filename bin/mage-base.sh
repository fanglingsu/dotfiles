# Basic function used for all mage_* scripts.
#
# Some of the function evaluate the DRY_RUN variable to only print some output
# instead of changing anything.

get_module_path() {
    echo "$BASE_PATH/app/code/$CODE_POOL/$NAME_SPACE/$MODULE"
}

# generates the docblock for given class
get_php_dockblock() {
    local class="$1"
    local name=${2:-"$NAME"}
    cat << EOM
<?php
/**
 * Copyright (c) 2008-$(date '+%Y') dotSource GmbH.
 * All rights reserved.
 * http://www.dotsource.de
 *
 * Contributors:
 * $name - initial contents
 */
EOM
    if [ "$class" != "" ]; then
        cat << EOM

/**
 * Class $class
 */
EOM
    fi
}

# generates the docblock for given user name or i not given with current $NAME
get_xml_docblock() {
    local name=${1:-"$NAME"}
    cat << EOM
<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (c) 2008-$(date '+%Y') dotSource GmbH.
    All rights reserved.
    http://www.dotsource.de

    Contributors:
    $name - initial contents
-->
EOM
}

# creates directory if id does not exist
#
# @param string directory path
create_dir() {
    dir="$1"
    if [ ! -d $dir ]; then
        mkdir -p "$dir"
        if [ $? -ne 0 ]; then
            echo "Could not create $dir"
            exit 1
        fi
    fi

    return 0
}

# creates a file under given path with also given content
#
# @param string path too the file to create
# @param string content to put into file
create_file_with_content() {
    local file="$1"
    local content="$2"
    local dir=`dirname "$file"`

    # check if dry run mode is off
    if [ $DRY_RUN -eq 0 ]
    then
        create_dir "$dir"
        if [ "$content" != "" ]; then
            # save the content in file
            echo "$content" > "$file"
        else
            # only create the file
            # # only create the file
            touch "$file"
        fi

        write_success "Created $file"
    else
        echo -e "${CG}Create File $file${CDEF}"
        echo "$content"
    fi
}

# Splits string at _ and make all but the first word start with an uppercase
# char. For example "foo_bar_baz" -> "fooBarBaz"
#
# @param string
camelize() {
   echo "$1" | sed -e 's/_/ /g' -e 's/ ./\U&\E/g' -e 's/ //g'
}
