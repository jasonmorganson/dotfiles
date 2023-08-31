source ~/.cache/nushell/default_config.nu
source ~/.config/nushell/aliases.nu

$env.config = ($env.config | upsert edit_mode vi)

use tea.nu
use xdg.nu
use ls_colors.nu
overlay use git.nu
overlay use starship.nu
