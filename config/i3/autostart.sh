#!/bin/bash
# grep -rh Exec ~/.config/autostart | while read -r line ; do 
#    ${line:5} &
# done

# xmodmap ~/.Xmodmap
setxkbmap -option 'ctrl:nocaps'
setxkbmap "us,ru" ",winkeys" "grp:win_space_toggle"
