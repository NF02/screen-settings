#!/bin/env sh
screen1=$(xrandr --listmonitors | awk '{print $2}' | grep - | sed 's/+//' | sed 's/*//' | grep "HDMI-A") 
screen2=$(xrandr --listmonitors | awk '{print $2}' | grep - | sed 's/+//' | sed 's/*//' | grep "DVI")
screen3=$(xrandr --listmonitors | awk '{print $2}' | grep - | sed 's/+//' | sed 's/*//' | grep "HDMI-2")
# screen layout
#  __________________________                          ________________
# |                          |                        |                |
# |                          |                        |                |
# |                          |                        |                |
# |         screen1          |                        |                |
# |                          |                        |                |
# |                          |                        |     screen2    |
# |__________________________| _____________________  |                |
#                             |                     | |                |
#                             |                     | |                |
#                             |                     | |                |
#                             |       screen3       | |                |
#                             |                     | |________________|
#                             |                     |
#                             |_____________________|
 

xrandr --output DisplayPort-0 --off --output $screen1 \
       --mode 1920x1080 --pos 0x321 --rotate normal --output $screen2 --mode 1920x1080 \
       --pos 2835x0 --rotate left --output $screen3 --mode 1360x768 --pos 1461x1401 --rotate \
       normal --output DVI-2-0 --off --output VGA-2-0 --off
