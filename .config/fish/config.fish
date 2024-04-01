if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a 'v' 'nvim'
    abbr -a 'sv' 'sudo nvim'
    abbr -a 'pkgs' 'paru -Ss'
    abbr -a 'pkgi' 'paru -S'
    abbr -a 'pkgu' 'paru -Syyu'
    abbr -a 'lg' 'lazygit'
    abbr -a 'cat' 'bat'
    abbr -a 'ls' 'eza'
    abbr -a 'la' 'eza -la'
    abbr -a 'll' 'eza -ll'
    fish_vi_key_bindings
end

