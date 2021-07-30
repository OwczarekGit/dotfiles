# Fix Java apps
export _JAVA_AWT_WM_NONREPARENTING=1

# Startup
setxkbmap pl &
udiskie -A &
nitrogen --restore &
picom --config ~/.config/picom/picom.conf &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
xrdb ~/.Xresources &
clipmenud &
~/.local/share/sysstat/sysstat.sh &

# Run WM
while true; do
	dwm
done
