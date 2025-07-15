def get-available-packages [] { pacman -Ssq | lines | collect }

export def pkgi [...pkgs: string@get-available-packages] { sudo pacman -S ...$pkgs --needed }

