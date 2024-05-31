#!/usr/bin/env sh

# Terminate any polybar instances already running
killall -q polybar

# Wait until the processes have shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar on all active monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
