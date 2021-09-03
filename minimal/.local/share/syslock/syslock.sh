#!/bin/bash

WORKDIR="$HOME/.local/share/syslock"
SCREEN="$WORKDIR/lockimg.png"

mkdir -p $WORKDIR
cd $WORKDIR

xset dpms 10 10 10

maim -d 0.5 -q -m 6 $SCREEN
convert $SCREEN -scale 20%  -blur 0x16 -emboss 10 $SCREEN
convert $SCREEN -resize 1366x768 $SCREEN

case $1 in
	nofork)
		i3lock -n -e -c "#000000" -i $SCREEN
	;;

*)
	i3lock -e -c "#000000" -i $SCREEN
	;;
esac

rm $SCREEN

xset dpms 0 0 0
