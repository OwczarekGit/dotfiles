#!/bin/bash

WORK_DIR="$HOME/.local/share/sysstat"

OUTPUT_FILE="/tmp/system_stats"
mkdir -p $WORK_DIR


getIP(){
	local IP=$(nmcli -p | grep inet4 | sed "s/inet4//g; s/ //g; s/\t//g; s/\/.*/ |/g")
	echo $IP
}

getVol(){
	local VOL=$(pamixer --get-volume)
	echo "$VOL%"
}

getDate(){
	local date=$(date +%d.%m.%Y)
	echo $date
}

getTime(){
	local time=$(date +%H:%M)
	echo $time
}


IP_ADDRESS=$(getIP)
DATE=$(getDate)
TIME=$(getTime)
VOLUME=$(getVol)

echo "  $IP_ADDRESS   $VOLUME | $DATE | $TIME " > $OUTPUT_FILE
