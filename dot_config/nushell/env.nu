source ~/.cache/nushell/xdg.nu
source ~/.cache/nushell/ls_colors.nu

let-env PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin' | prepend $"($env.HOME)/.tea/.local/bin")

let-env GPG_TTY = (echo (tty))

