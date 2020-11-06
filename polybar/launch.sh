#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep =u $UID -x polybar >/dev/null; do
sleep 1; done


# Launch polybar on all monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload -l info example &
done

# Launch bar 1 and bar 2
# polybar example 
