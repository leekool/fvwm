#!/bin/bash

# gets dimensions of monitor the active window is on
screen=($(screenheighttaskbar2.sh))
#screen=($(currentscreenall.sh window | awk 'BEGIN {FS="x"} {print $1, $2}'))

screen_width=${screen[0]}
screen_height=${screen[1]}

# gets info related to active window
info=($(xwininfo -id $(xdotool getactivewindow) | awk 'BEGIN {FS=":"} {print $2}'))

xpos=${info[2]}
ypos=${info[3]}
width=${info[6]}
height=${info[7]}

# window sizing
if      [ $height -gt $(($screen_height / 2)) ] && [ $width -gt $(($screen_width / 2)) ]; then
    size="full_width_full_height"
elif    [ $height -gt $(($screen_height / 2)) ] && [ $width -lt $(($screen_width / 2)) ]; then
    size="half_width_full_height"
else
    size="half_height"
fi

gap=8
gap2=$((gap * 2))
gap34=$((gap + gap / 2))


if      [ $screen_width -gt $screen_height ]; then
    case $1 in
        "up")
            if      [ "$size" == "half_width_full_height" ]; then
                echo "Resize frame keep $(($screen_height / 2))p"
            else
                echo "LeeMaximize"
            fi
            ;;
        "down")
            if      [ "$ypos" -lt 30 ] && [ "$size" == "half_height" ]; then
                echo "Move keep $(($screen_height / 2))p"
            elif    [ "$size" == "half_width_full_height" ]; then
                echo "ResizeMove frame keep $(($screen_height / 2))p keep $(($screen_height / 2))p"
            else
                echo "LeeIconify"
            fi
            ;;
        "left")
            echo "ResizeMove frame $(expr $(currentscreenall.sh window | cut -d 'x' -f1) / 2 - $gap34)p \
                                   $(expr $(screenheighttaskbar.sh) - $gap2)p ${gap}p ${gap}p"
            ;;
        "right")
            echo "ResizeMove frame $(expr $(currentscreenall.sh window | cut -d 'x' -f1) / 2 - $gap34)p \
                                   $(expr $(screenheighttaskbar.sh) - $gap2)p -${gap}p ${gap}p"
            ;;
    esac
else
    case $1 in
        "up")
            if      [ "$size" == "half_width_full_height" ]; then
                echo "Resize frame keep $(($screen_height / 2))p"
            else
                echo "LeeMaximize"
            fi
            ;;
        "down")
            if      [ "$ypos" -lt 30 ] && [ "$size" == "half_height" ]; then
                echo "Move keep $(($screen_height / 2))p"
            elif    [ "$size" == "half_width_full_height" ]; then
                echo "ResizeMove frame keep $(($screen_height / 2))p keep $(($screen_height / 2))p"
            else
                echo "LeeIconify"
            fi
            ;;
        "left")
            echo "ResizeMove frame $(currentscreenall.sh window | cut -d 'x' -f1)p $(expr $(screenheighttaskbar.sh) / 2)p 0 0"
            ;;
        "right")
            echo "ResizeMove frame $(currentscreenall.sh window | cut -d 'x' -f1)p $(expr $(screenheighttaskbar.sh) / 2)p 0 50"
            ;;
    esac
fi

# side may be irrelevant
# if      ((xpos >= 1920 && xpos <= 1930)) || ((xpos >= 0 && xpos <= 10)); then
#     side="left"
# else
#     side="right"
# fi
