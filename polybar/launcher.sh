#!/bin/bash

# Terminate already running bar instances
#killall -q polybar
pkill -f "polybar -q $1"

# Wait until the processes have been shut down
while pgrep -u $UID -f "polybar -q $1">/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -q $1 &
