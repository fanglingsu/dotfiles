# Basic function used for all mage_* scripts.
#
# Some of the function evaluate the DRY_RUN variable to only print some output
# instead of changing anything.

# prepare some global used variables
MODULE_PATH="$BASE_PATH/app/code/$CODE_POOL/$NAME_SPACE/$MODULE"
PHPDOCBLOCK="<?php
/**
 * Copyright (c) 2008-$(date '+%Y') dotSource GmbH.
 * All rights reserved.
 * http://www.dotsource.de
 *
 * Contributors:
 * $NAME - initial contents
 */"
XMLDOCBLOCK="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!--
    Copyright (c) 2008-$(date '+%Y') dotSource GmbH.
    All rights reserved.
    http://www.dotsource.de

    Contributors:
    $NAME - initial contents
-->"


# creates directory if id does not exist
#
# @param string directory path
function create_dir() {
    dir="$1"
    if [ ! -d $dir ] ; then
        mkdir -p "$dir"
        if [ $? -ne 0 ] ; then
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
function create_file_with_content() {
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
function camelize()
{
   echo "$1" | sed -e 's/_/ /g' -e 's/ ./\U&\E/g' -e 's/ //g'
}
