# Fix Java apps
export _JAVA_AWT_WM_NONREPARENTING=1

# Startup
lxsession &
setxkbmap pl &
udiskie -A &
nitrogen --restore &
picom --config ~/.config/picom/picom.conf &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
xrdb ~/.Xresources &
clipmenud &
kdeconnect-indicator &
~/.local/share/sysstat/update_sysstat_loop.sh &

# Run WM
while true; do
	dbus-run-session dwm
done
