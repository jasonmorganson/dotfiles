source ~/.config/nushell/default_env.nu

sh -c $". ($env.HOME)/.profile && env"
    | lines
    | parse "{name}={value}"
    | transpose --header-row
    | into record
    | reject --ignore-errors PWD FILE_PWD CURRENT_FILE
    | load-env

