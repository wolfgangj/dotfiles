#!/bin/ksh
xset -b
xmodmap ~/.Xmodmap
xset +fp /usr/local/share/fonts/ghostscript/
xset +fp /usr/local/share/fonts/noto
xset +fp /usr/local/share/fonts/terminus

export LANG=en_US.UTF-8

# make trackpoint scroll!
#xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
#xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 0
#xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

mixerctl outputs.master=120,120

# in /etc/X11/xenodm/Xsetup_0:
# xsetroot -solid darkcyan

~/bin/wbat /bin/sh -c 'i3-msg fullscreen disable; i3-nagbar -m "battery low"' &

#xterm &
exec i3
