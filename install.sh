#!/usr/bin/env bash
# Syncronizes dotfiles from current dir with home dir.
# Pattern to exclude files from sync can be added to ./excludes

function doSync() {
    rsync --exclude-from=excludes -av --no-perms . "$HOME"
    # apply patches
    if [[ -x "./patch.sh" ]]; then
        ./patch.sh
    fi
}

if [ "$1" == "-f" ]; then
    doSync
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doSync
    fi
fi
unset doSync
