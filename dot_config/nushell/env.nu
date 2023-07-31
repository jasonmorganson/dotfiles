source ~/.cache/nushell/default_env.nu
source ~/.cache/nushell/xdg.nu
source ~/.cache/nushell/ls_colors.nu

let-env GPG_TTY = (echo (tty))

$env.TEA_DIR = $env.HOME
