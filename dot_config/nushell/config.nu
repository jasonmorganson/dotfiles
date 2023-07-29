source ~/.cache/nushell/default_config.nu
source ~/.cache/tea/init.nu
source ~/.cache/starship/init.nu
source ~/.config/nushell/aliases.nu

$env.config = ($env.config | upsert edit_mode vi)

$env.config = ($env.config | upsert hooks.env_change.PWD {[{ tea_hook }]})
