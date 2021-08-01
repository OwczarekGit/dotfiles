#!/bin/bash

WORK_DIR="$HOME/.local/share/sysstat"

OUTPUT_FILE="/tmp/system_stats"
mkdir -p $WORK_DIR


getIP(){
	local IP=$(nmcli -p | grep inet4 | sed "s/inet4//g; s/ //g; s/\t//g; s/\/.*/ |/g")
	echo $IP
}

getPower(){
	local power=$($WORK_DIR/power.sh)
	echo "$power"
}

getSong(){
	local song=$($WORK_DIR/song.sh)
	echo "$song"
}

getBrightness(){
	local brightness=$($WORK_DIR/backlight.sh)
	echo "$brightness"
}

getVol(){
	local VOL=$($WORK_DIR/sound.sh)
	echo "$VOL"
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
POWER=$(getPower)
BRIGHTNESS=$(getBrightness)
SONG=$(getSong)

echo "$SONG |  $IP_ADDRESS $VOLUME | $POWER% | $BRIGHTNESS% | $DATE | $TIME " > $OUTPUT_FILE
