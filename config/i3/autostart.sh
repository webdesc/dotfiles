#!/bin/bash
# grep -rh Exec ~/.config/autostart | while read -r line ; do 
#    ${line:5} &
# done

# xmodmap ~/.Xmodmap
setxkbmap -option 'ctrl:swapcaps'
setxkbmap "us,ru" ",winkeys" "grp:shift_caps_toggle"
