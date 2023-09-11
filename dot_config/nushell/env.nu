source ~/.local/share/nushell/default_env.nu

$env.NU_LIB_DIRS = ($env.NU_LIB_DIRS | default [] | append ($env.HOME | path join ".config" "nushell" "scripts"))
