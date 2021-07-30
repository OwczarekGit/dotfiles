#!/bin/bash

INPUT_FILE="/tmp/system_stats"

~/.local/share/sysstat/sysstat.sh
xsetroot -name "$(cat $INPUT_FILE)"
