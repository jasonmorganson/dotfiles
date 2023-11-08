source ~/.local/share/nushell/default_env.nu

bash -c $"source ($env.HOME)/.profile && env"
    | lines
    | parse "{name}={value}"
    | transpose --header-row
    | into record
    | load-env

$env.NU_LIB_DIRS = ($env.NU_LIB_DIRS | default [] | append ($env.HOME | path join ".config" "nushell" "scripts"))

