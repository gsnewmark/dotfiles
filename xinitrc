#!/bin/sh

# thinkpad trackpad scrolling
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 8 1

# keyboard fiddlings
setxkbmap -layout us,ua
setxkbmap -option grp:switch,grp:ctrl_shift_toggle us,ua
setxkbmap -option ctrl:nocaps

xxkb &
nm-applet --sm-disable &
dropboxd &
emacs --daemon &
exec awesome
