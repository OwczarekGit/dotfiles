#!/bin/bash

INPUT_FILE="/tmp/system_stats"

while true;
	do
		~/.local/share/sysstat/sysstat.sh
		xsetroot -name "$(cat $INPUT_FILE)"
		sleep 1
	done
