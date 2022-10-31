#!/bin/sh

screen=($(xrandr | awk '{gsub(" primary", ""); print}' | awk -F'[ +]' '$0 ~ /+/ {print $1,$3, $4}' | awk 'NF>=2{print $0}'))

screen1="${screen[0]} ${screen[1]} ${screen[2]}"
screen2="${screen[3]} ${screen[4]} ${screen[5]}"

echo "${screen1[1]}"
