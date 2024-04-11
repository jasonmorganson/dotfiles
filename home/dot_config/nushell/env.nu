source ~/.config/nushell/default_env.nu

bash -c $"source ($env.HOME)/.profile && env"
    | lines
    | parse "{name}={value}"
    | transpose --header-row
    | into record
    | reject --ignore-errors FILE_PWD CURRENT_FILE
    | load-env

