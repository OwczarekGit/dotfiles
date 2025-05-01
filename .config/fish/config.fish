if status is-interactive
    alias 'v' 'nvim'
    alias 'sv' 'sudo nvim'

    alias 'lg' 'lazygit'

    alias 'cat' 'bat -p'

    alias 'pkgu' 'paru -Syyu'
    alias 'pkgi' 'paru -S'
    alias 'pkgs' 'paru -Ss'

    alias 'ls' 'exa'
    alias 'la' 'exa -lah'
    alias 'll' 'exa -llh'

    fzf --fish | source

    fish_vi_key_bindings
end
