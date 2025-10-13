#!/usr/bin/nu

export def main [] {
  (1..9)
    | each {|it|
      $it | reset-switch-to-app
      $it | set-switch-to-workspace
      $it | set-move-to-workspace
    }

    enable-resize
    disable-attach-modals
    set-close-bind
    set-fullscreen-bind
    set-button-layout
}

def gs [key, prop, value] {
  gsettings set $key $prop $value  
}

def reset-switch-to-app [] {
  gs org.gnome.shell.keybindings switch-to-application-($in) "[]"
}

def set-switch-to-workspace [] {
  gs org.gnome.desktop.wm.keybindings switch-to-workspace-($in) $"['<Super>($in)']"
}

def set-move-to-workspace [] {
  gs org.gnome.desktop.wm.keybindings move-to-workspace-($in) $"['<Super><Shift>($in)']"
}

def enable-resize [] {
  gs org.gnome.desktop.wm.preferences resize-with-right-button true
}

def disable-attach-modals [] {
  gs org.gnome.mutter attach-modal-dialogs false
}

def set-close-bind [] {
  gs org.gnome.desktop.wm.keybindings close "['<Super>q']"
}

def set-fullscreen-bind [] {
  gs org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
}

def set-button-layout [] {
  gs org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,close"
}
