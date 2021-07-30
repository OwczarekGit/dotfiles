#!/bin/bash

WORK_DIR="$HOME/.local/share/sysstat"

OUTPUT_FILE="$WORK_DIR/output"
mkdir -p $WORK_DIR


getIP(){
	local IP=$(nmcli -p | grep inet4 | sed "s/inet4//g; s/ //g; s/\t//g; s/\/.*/ |/g")
	echo $IP
}

getDate(){
	local date=$(date +%d.%m.%Y)
	echo $date
}

getTime(){
	local time=$(date +%H:%M)
	echo $time
}


while true; do
	IP_ADDRESS=$(getIP)
	DATE=$(getDate)
	TIME=$(getTime)

	echo " IP: $IP_ADDRESS $DATE | $TIME " > $OUTPUT_FILE
	xsetroot -name "$(cat $OUTPUT_FILE)"
	sleep 1
done


