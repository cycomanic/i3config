#!/bin/bash
#ICON=~/.local/share/icons/screenlock.png
#scrot /tmp/screen.png
#WIDTH=$(identify /tmp/screen.png | cut -f 3 -d' '| cut -d'x' -f 1)
#HEIGHT=$(identify /tmp/screen.png | cut -f 3 -d' '| cut -d'x' -f 2)
#MONITORS=$(xrandr --listactivemonitors |wc -l)
#convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#if [[ $MONITORS -lt 2]]; then 
#[[ -f $ICON ]] && convert /tmp/screen.png $ICON -geometry +1440+900 -composite -matte /tmp/screen.png
/home/jschrod/.local/bin/takescreenshot_mss.py /tmp/screen.png
i3lock -d -i /tmp/screen.png
rm /tmp/screen.png 
