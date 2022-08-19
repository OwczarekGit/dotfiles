#!/bin/bash

BG_PATH="$1"
BG_FILES=$(ls $BG_PATH)
#SELECTION=$(echo "$BG_FILES" | wofi --dmenu)
SELECTION=$(echo "$BG_FILES" | shuf | head -n1 )

pkill swaybg
swaybg -i "$BG_PATH//$SELECTION"


