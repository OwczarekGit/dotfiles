#!/usr/bin/env nu

const OPTION: string = "cursor:zoom_factor"; 

def main [factor: float] {
  hyprctl getoption $OPTION -j
    | from json
    | get float
    | [ ($in * (1.0 + $factor)), 1.0]
    | math max
    | hyprctl keyword $OPTION $in
}

