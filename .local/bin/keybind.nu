#!/usr/bin/env nu

let MAP = {
  "Alacritty": {
    "1": ', A,'
  },
  "factorio": {
    "1": ', M,'
  }
  "valheim.x86_64": {
    "1": ', M,'
  }
  "Minecraft* 1.21.1": {
    "1": ', M,'
  }
};

def get_window [] {
  hyprctl activewindow -j
    | from json
    | get class
}

def main [layer: string] {
  let key = $MAP
    | get ( get_window )
    | get $layer
    ;

  hyprctl dispatch sendshortcut ($key)
}

