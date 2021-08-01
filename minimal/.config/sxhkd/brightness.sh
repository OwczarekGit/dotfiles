#!/bin/bash

OPTION=$1
DIRECTORY="/sys/class/backlight/intel_backlight"
STEP=38

MAX=$(cat "$DIRECTORY/max_brightness")
NOW=$(cat "$DIRECTORY/brightness")

#echo $MAX $NOW

if [ $1 == "+" ]; then
	tmp=$(( $NOW + $STEP ))
	if [ $tmp -gt $MAX ]; then
		NOW=$MAX
	else
		NOW=$(( $NOW + $STEP ))
	fi
fi

if [ $1 == "-" ]; then
	tmp=$(( $NOW - $STEP ))
	if [ $tmp -lt 0 ]; then
		NOW="0"
	else
		NOW=$(( $NOW - $STEP ))
	fi
fi

echo $NOW > "$DIRECTORY/brightness"
