#!/usr/bin/env bash
# check if there are changes in $HOME/.* that where not applied into this
# repository

diff -rB "$HOME" . | awk '/^diff /{print $3 " " $4}'
