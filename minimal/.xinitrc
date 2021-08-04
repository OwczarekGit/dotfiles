# Fix Java apps
export _JAVA_AWT_WM_NONREPARENTING=1

# Startup
lxsession &
setxkbmap pl &
udiskie -ANt &
nitrogen --restore &
picom --config ~/.config/picom/picom.conf &
xrdb ~/.Xresources &
clipmenud &
kdeconnect-indicator &
SHELL=/bin/bash sxhkd -c ~/.config/sxhkd/sxhkdrc &
#~/.local/share/sysstat/update_sysstat_loop.sh &
SHELL=/bin/bash ~/.local/share/dwmBard/dwmbard &

# Run WM
while true; do
	dwm
done
