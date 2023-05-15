#!/usr/bin/fish

set CURRENT_ZOOM (hyprctl getoption misc:cursor_zoom_factor | grep 'float' | awk '{print $2}')
hyprctl keyword misc:cursor_zoom_factor (math $CURRENT_ZOOM + 0.05)
