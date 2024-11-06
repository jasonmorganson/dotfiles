set -a

direnv_config_dir="${DIRENV_CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}/direnv}"

for lib in "$direnv_config_dir/lib/"*.sh; do
  source "$lib"
done
