source ~/.config/nushell/default_config.nu

$env.config = (
  $env.config
  | upsert edit_mode vi
  | upsert history.file_format "sqlite"
  | upsert history.isolation true
)


overlay use nu_scripts/aliases/chezmoi/chezmoi-aliases.nu
overlay use nu_scripts/aliases/git/git-aliases.nu
overlay use git-alias.nu
overlay use aliases.nu

use theme.nu
use starship.nu
use prompt.nu

