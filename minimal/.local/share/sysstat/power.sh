#!/bin/bash


# Read the battery/batteries capacity.
POWER_PATH="/sys/class/power_supply"

count=0
total=0
for battery in $(ls $POWER_PATH | grep "BAT*");
do
	level=$(cat $POWER_PATH/$battery/capacity)
	total=$(($total + $level))
	count=$(($count + 1))
done

CHARGE=$(echo "scale=2; ($total/(100*$count)*100)" | bc | sed "s/\..*$//g")

CHARGING=$(cat "$POWER_PATH/AC/online")
prefix=""

if [ $CHARGING == "1" ]; then
	prefix=""
else
	prefix=""
fi

echo "$prefix $CHARGE"


