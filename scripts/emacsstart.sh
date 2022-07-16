#!/bin/bash

emacsclient -n -e "(> (length (frame-list)) 1)" | grep -q t
if [ "$?" = "1" ]; then
    emacsclient -c -n -a "" -F "((left . 0)(width . (text-pixels . $(expr $(currentscreenall.sh window | cut -d 'x' -f1) / 2))(height . (text-pixels . $(screenheighttaskbar.sh))))(fullscreen . fullheight))" -e "(switch-to-buffer (doom-fallback-buffer))"
else
    emacsclient -n -a "" -e "(switch-to-buffer (doom-fallback-buffer))"
fi
