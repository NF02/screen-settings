#!/bin/env sh
screen1=$(xrandr | grep " connected " | awk '{ print$1 }' | grep "HDMI-A") 
screen2=$(xrandr | grep " connected " | awk '{ print$1 }' | grep "DVI")
screen3=$(xrandr | grep " connected " | awk '{ print$1 }' | grep "HDMI-2")

setup1()
{
    xrandr --output DisplayPort-0 --off --output $screen1 \
       --mode 1920x1080 --pos 0x321 --rotate normal --output $screen2 --mode 1920x1080 \
       --pos 2835x0 --rotate left --output $screen3 --mode 1360x768 --pos 1461x1401 --rotate \
       normal 
}

setup2()
{
    xrandr --output DisplayPort-0 --off --output $screen1 --mode 1920x1080 --pos 0x0 \
	   --rotate normal --output $screen2 --mode 1920x1080 --pos 1920x0 --rotate normal \
	   --output $screen3 --off 

}

if [[ $1 == "-1" ]];then
	setup1
	exit 0
   elif [[ $1 == "-2" ]];then
	setup2
	exit 0
fi
