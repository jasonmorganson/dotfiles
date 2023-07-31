source ~/.cache/nushell/default_config.nu
source ~/.config/nushell/aliases.nu

$env.config = ($env.config | upsert edit_mode vi)

overlay use tea.nu
overlay use starship.nu
