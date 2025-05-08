#!/usr/bin/env nu

def main [ws: number] {
  hyprctl monitors -j
    | from json
    | where $it.focused == true
    | first
    | get name
    | match $in { "DP-1" => 0, "HDMI-A-1" => 10, "DP-2" => 20 }
    | $in + $ws
}
