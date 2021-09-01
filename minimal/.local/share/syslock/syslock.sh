#!/bin/bash

WORKDIR="$HOME/.local/share/syslock"
SCREEN="$WORKDIR/lockimg.png"

mkdir -p $WORKDIR
cd $WORKDIR

maim -q -m 6 $SCREEN
convert $SCREEN -scale 20% -blur 0x16 -emboss 10 $SCREEN
convert $SCREEN -resize 1920x1080 $SCREEN
i3lock -e -c "#000000" -i $SCREEN
rm $SCREEN
