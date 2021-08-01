#!/bin/bash

MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep "yes")
PREFIX=""
VOLUME=$(pamixer --get-volume)

if [ $MUTED  -z ]; then
	PREFIX=""
else
	PREFIX=""
fi

echo "$PREFIX $VOLUME%"
