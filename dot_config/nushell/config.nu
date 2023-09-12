source ~/.local/share/nushell/default_config.nu

$env.config = ($env.config | upsert edit_mode vi)

overlay use tea.nu
use xdg.nu
use ls_colors.nu
overlay use git.nu
overlay use aliases.nu
overlay use starship.nu
