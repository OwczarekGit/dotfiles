#!/bin/bash

#printf "Cancel\nLock\nSuspend\nShutdown\nReboot" | dmenu -p "Option:" -l 10
SELECTION=$(printf "Cancel\nLock\nSuspend\nShutdown\nReboot" | rofi -show -dmenu -font "Ubuntu 12" -i -p "Option" -l 5)

case $SELECTION in

	Cancel)
		exit
		;;

	Lock)
		~/.local/share/syslock/syslock.sh
		;;

	Suspend)
		~/.local/share/syslock/syslock.sh
		systemctl suspend
		;;

	Shutdown)
		systemctl poweroff
		;;

	Reboot)
		systemctl reboot
		;;
esac


