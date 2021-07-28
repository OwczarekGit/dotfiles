#xrandr -s 1920x1080 &
setxkbmap pl &
udiskie -A &
nitrogen --restore &
picom  --config ~/.config/picom/picom.conf &
xrdb ~/.Xresources &
~/.local/share/sysstat/sysstat.sh &

while true; do
	dwm
done
