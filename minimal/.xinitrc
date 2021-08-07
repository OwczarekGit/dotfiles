#!/bin/bash

# Fix Java apps
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_STYLE_OVERRIDE=kvantum

# Startup
xset -dpms &
xset s 0 &
xrdb ~/.Xresources &
SHELL=/bin/bash ~/.local/share/dwmBard/dwmbard &

# Run WM
while true; do
	dwm
done
