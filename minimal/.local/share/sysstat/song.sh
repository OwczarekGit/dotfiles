#!/bin/bash

SONG=$(playerctl metadata title)
ARTIST=$(playerctl metadata artist)
STATUS=$(playerctl status)
PREFIX=""

if [ $STATUS == "Playing" ]; then
	PREFIX=""
else
	PREFIX=""
fi

echo "$PREFIX $ARTIST - $SONG"
