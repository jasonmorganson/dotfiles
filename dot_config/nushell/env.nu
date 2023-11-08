source ~/.local/share/nushell/default_env.nu

$env.NU_LIB_DIRS = ($env.NU_LIB_DIRS | default [] | append ($env.HOME | path join ".config" "nushell" "scripts"))

$env.PATH = (
  $env.PATH
  | split row (char esep)
  | prepend "/usr/local/bin"
  | prepend "/opt/homebrew/bin"
  | prepend ($env.HOME | path join '.local' 'bin')
)
