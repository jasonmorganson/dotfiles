source ~/.local/share/nushell/default_env.nu

bash -c $"source ($env.HOME)/.profile && env"
    | lines
    | parse "{name}={value}"
    | filter { |var| (not $var.name in $env) or $var.value != ($env | get $var.name) }
    | where not name in ["_", "LAST_EXIT_CODE", "DIRS_POSITION"]
    | transpose --header-row
    | into record
    | load-env

