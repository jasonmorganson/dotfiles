use ($nu.default-config-dir | path join "mise.nu")

let vendor_autoload = $nu.data-dir | path join "vendor" "autoload"
mkdir $vendor_autoload
^starship init nu | save ($vendor_autoload | path join "starship.nu") --force

let user_autoload = $nu.default-config-dir | path join "autoload"
mkdir $user_autoload
^fnox activate nu | save ($user_autoload | path join "fnox.nu") --force
^wt config shell init nu | save ($user_autoload | path join "wt.nu") --force
