#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

#launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log /tmp/polybar2.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown
