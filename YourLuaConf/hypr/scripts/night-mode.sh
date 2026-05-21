#!/bin/bash

# Check if wlsunset Is Already Running
if pgrep -x "hyprsunset" > /dev/null; then
    # Kill wlsunset If Running 
    pkill hyprsunset
    notify-send "Night Light" "Off" -u "low"
else
    # Start wlsunset For Night Mode
    hyprsunset --temperature 4000 &
    notify-send "Night Light" "On" -u "low"
fi

