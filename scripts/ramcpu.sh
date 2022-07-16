#!/bin/sh

RAM=$(free -m | awk -v CONVFMT='%.2f' 'NR==2{print substr($3*100/$2, 1, length ($2) - 1)}')
CPU=$(uptime | awk '{print substr($9, 1, length($9) - 1)}')

case $1 in
    "ram")
        echo $RAM
        ;;
    "cpu")
        echo $CPU
        ;;
esac
