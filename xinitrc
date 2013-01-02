#!/bin/sh

# thinkpad trackpad scrolling
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Middle Button Emulation" 8 1

# keyboard fiddlings
setxkbmap -option grp:switch,grp:shift_toggle us,ua -variant ,rstu
setxkbmap -option ctrl:nocaps

# Start Thinkpad OSD daemon
if [ -x /usr/bin/tpb ] &&  [ -w /dev/nvram ] && [ -r /dev/nvram ]; then
    /usr/bin/tpb -d
fi

skype &
xxkb &
xbindkeys &
tidybattery &
volumeicon &
volnoti &
nm-applet --sm-disable &
dropboxd &
emacs --daemon &
exec awesome
