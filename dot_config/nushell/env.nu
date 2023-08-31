source ~/.cache/nushell/default_env.nu
source ~/.cache/nushell/xdg.nu
source ~/.cache/nushell/ls_colors.nu

$env.GIT_AUTHOR_NAME = "Jason Morganson"
$env.GIT_AUTHOR_EMAIL = "128727+jasonmorganson@users.noreply.github.com"
$env.GIT_COMMITTER_NAME = $env.GIT_AUTHOR_NAME
$env.GIT_COMMITTER_EMAIL = $env.GIT_AUTHOR_EMAIL

$env.NU_LIB_DIRS = ($env.NU_LIB_DIRS | default [] | append ($env.HOME | path join ".config" "nushell" "lib"))

$env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/local/bin')
