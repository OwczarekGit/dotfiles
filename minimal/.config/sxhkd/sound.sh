#!/bin/bash

STEP=3
MAX=150

if [ $1 == "+" ]; then
	tmp=$(( $(pamixer --get-volume @DEFAULT_SINK@) + 3 ))
	if [ $tmp -gt $MAX ]; then
		pactl set-sink-volume @DEFAULT_SINK@ 150% && kill -10 $(pgrep dwmbard)
	else
		pactl set-sink-volume @DEFAULT_SINK@ +$STEP% && kill -10 $(pgrep dwmbard)
	fi
fi

if [ $1 == "-" ]; then
	tmp=$(pamixer --get-volume @DEFAULT_SINK@)
	if [ $tmp -lt 0 ]; then
		pactl set-sink-volume @DEFAULT_SINK@ 0% && kill -10 $(pgrep dwmbard)
	else
		pactl set-sink-volume @DEFAULT_SINK@ -$STEP% && kill -10 $(pgrep dwmbard)
	fi
fi
