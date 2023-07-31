source ~/.cache/nushell/default_env.nu
source ~/.cache/nushell/xdg.nu
source ~/.cache/nushell/ls_colors.nu

$env.GPG_TTY = (echo (tty))

$env.TEA_DIR = $env.HOME

$env.NU_LIB_DIRS = [
    ($env.XDG_CACHE_HOME | path join "tea")
    ($env.XDG_CACHE_HOME | path join "starship")
    ($env.XDG_CACHE_HOME | path join "nushell")
    ($nu.default-config-dir | path join "lib")
    ($nu.default-config-dir | path join "scripts")
]

