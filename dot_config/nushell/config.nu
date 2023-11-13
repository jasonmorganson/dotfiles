source ~/.local/share/nushell/default_config.nu

$env.config = (
  $env.config
  | upsert edit_mode vi
  | upsert history.file_format "sqlite"
  | upsert history.isolation true
)


use xdg.nu
use theme.nu
use ls_colors.nu
overlay use git.nu
overlay use aliases.nu

source ~/.config/nushell/scripts/prompt.nu
