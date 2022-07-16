#!/bin/bash

# works out if screen active window is on contains taskbar and, if so, negates 33px from
# screen height in order to compensate for the taskbar height

taskbar=$(currentscreenall.sh taskbar | cut -d 'x' -f2)
window=$(currentscreenall.sh window | cut -d 'x' -f2)

if      (($taskbar == $window))
then
    screenheight=$(($window - 30))
else
    screenheight=$window
fi

echo $screenheight
