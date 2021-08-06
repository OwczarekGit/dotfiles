#!/bin/bash

# Fix Java apps
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_STYLE_OVERRIDE=kvantum

# Startup
xset -dpms &
xset s 0 &
lxsession &
xrdb ~/.Xresources &

# There is some problems with rofi being run form sxhkd 
# when sxhkd was started in dwmBard (spotify-adblock fails to open)
# will try to fix it.
SHELL=/bin/bash sxhkd &
SHELL=/bin/bash ~/.local/share/dwmBard/dwmbard &

# Run WM
while true; do
	dwm
done
