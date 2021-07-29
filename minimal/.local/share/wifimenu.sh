#!/bin/bash

NETWORK=$(nmcli device wifi list | sed -n '1!p' | cut -c 9- | dmenu -p "Select Network" -l 10)

BSSID=$(echo $NETWORK | awk '{print $1}')
SSID=$(echo $NETWORK | awk '{print $2}')
PASS=$(echo "" | dmenu -p "Password for: $SSID")

nmcli device wifi connect $BSSID password $PASS

