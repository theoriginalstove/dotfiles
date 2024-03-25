#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

#launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar.log /tmp/polybar2.log /tmp/polybar3.log
#polybar left --config=$HOME/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar center --config=$HOME/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown 
#polybar right --config=$HOME/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar3.log & disown 
#polybar mode --config=$HOME/.config/polybar/config.ini

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main --config=$HOME/.config/polybar/config.ini &
done

#polybar bottom --config=$HOME/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar2.log & disown 

