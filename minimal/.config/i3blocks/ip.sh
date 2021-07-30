#!/bin/bash

IP_WIFI=$(nmcli -p device show | grep IP4.ADDRESS | awk '{print $2}' | head -n 2 | tail -n 1)
IP_LAN=$(nmcli -p device show | grep IP4.ADDRESS | awk '{print $2}' | head -n 1)

if [ $IP_WIFI == "127.0.1.1/24" ]; then
	IP_WIFI="none"
fi

if [ $IP_LAN == "127.0.1.1/24" ]; then
	IP_LAN="none"
fi

echo "📡 $IP_WIFI  |  🌐 $IP_LAN"
