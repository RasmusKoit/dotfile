#!/bin/bash

sleep 0.1
monitor=$(xrandr --verbose | grep -m 1 -i connected | awk '{print $1}')
if [[ "$1" == "-d" ]]; then
    current=$(xrandr --verbose | grep -m 1 -i brightness | awk -F' ' '{ print $2 }')
    new=$(echo "$current - 0.1" | bc -l)
    xrandr --output $monitor --brightness 0$new
elif [[ "$1" == "-u" ]]; then
    current=$(xrandr --verbose | grep -m 1 -i brightness | awk -F' ' '{ print $2 }')
    new=$(echo "$current + 0.1" | bc -l)
    xrandr --output $monitor --brightness 0$new
else
    xrandr --output $monitor --brightness 1
fi
