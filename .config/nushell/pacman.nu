def get-available-packages [] { paru -Slqd | lines | collect }

export def pkgi [...pkgs: string@get-available-packages] { paru -S ...$pkgs --needed }
export def pkgu [] { paru -Syyu }
export def pkgs [phrase: string] { paru -Ss $phrase }

