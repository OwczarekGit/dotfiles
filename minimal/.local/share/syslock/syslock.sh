#!/bin/bash

WORKDIR="$HOME/.local/share/syslock"
SCREEN="$WORKDIR/lockimg.png"

mkdir -p $WORKDIR
cd $WORKDIR

maim -q -m 6 $SCREEN
convert $SCREEN -scale 20% -blur 0x16 $SCREEN
convert $SCREEN -resize 1280x800 $SCREEN
i3lock -e -c "#000000" -i $SCREEN
rm $SCREEN
