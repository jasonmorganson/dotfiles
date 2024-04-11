source ~/.config/nushell/default_env.nu

bash -c $"source ($env.HOME)/.profile && env"
    | lines
    | parse "{name}={value}"
    | transpose --header-row
    | into record
    | load-env

