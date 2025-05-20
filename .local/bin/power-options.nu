#!/usr/bin/env nu

const OPTIONS = {
  "Lock": "lock.fish",
  "Suspend": "hyprlock &; systemctl suspend",
  "Shutdown": "systemctl poweroff"
};

def main [] {
  let option = $OPTIONS
    | columns
    | to text
    | rofi -dmenu
    ;

    let cmd = $OPTIONS | get $option;

    fish -c $cmd;
}
