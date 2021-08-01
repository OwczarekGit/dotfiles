#!/bin/bash

DIRECTORY="/sys/class/backlight"
BACKLIGHT=$(ls $DIRECTORY)

NOW=$(cat "$DIRECTORY/$BACKLIGHT/brightness")
MAX=$(cat "$DIRECTORY/$BACKLIGHT/max_brightness")

PERCENT=$(echo "scale=2; ($NOW/$MAX)*100" | bc | sed "s/\..*$//g")
echo " $PERCENT"
