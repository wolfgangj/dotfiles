#!/bin/ksh
xset -b
xmodmap ~/.Xmodmap
xset +fp /usr/local/share/fonts/ghostscript/
export LANG=en_US.UTF-8

# make trackpoint scroll!
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 0
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

mixerctl outputs.master=60,60

#xterm &
exec i3
