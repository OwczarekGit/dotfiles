#!/usr/bin/fish
set REGION (slurp)
grim -g $REGION
grim -g $REGION - | wl-copy
