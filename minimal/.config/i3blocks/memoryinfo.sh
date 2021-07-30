#!/bin/bash

MEM=$(free -h --si | awk '{print $3}'| head -n -1 | tail -n 1)
	
echo "   $MEM"
