#!/usr/bin/env nu

def main [factor: float] {
  hyprctl getoption cursor:zoom_factor -j
    | from json
    | get float
    | [ ($in - $factor), 1.0]
    | math max
    | hyprctl keyword cursor:zoom_factor $in
}

