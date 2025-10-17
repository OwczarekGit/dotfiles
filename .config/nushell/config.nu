use pacman.nu *;

$env.config.show_banner = false;
$env.config.edit_mode = "vi"

$env.PATH = $env.PATH | append ~/.local/npm/bin

$env.PROMPT_COMMAND_RIGHT = {||
  let date = date now
  let formatted = ($date | format date '%H:%M | %d.%m.%Y')
  let branch = (git branch --show-current | complete)

  if $branch.exit_code == 0 {
    $"\(($branch.stdout | str trim)\) | ($formatted)"
  } else {
    $formatted
  }
}

alias v = nvim
alias sv = sudo nvim
alias lg = lazygit

