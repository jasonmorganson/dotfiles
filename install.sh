#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

if ! mise="$(command -v mise)"; then
	bin_dir="${HOME}/.local/bin"
	mise="${bin_dir}/mise"
	echo "Installing mise to '${mise}'" >&2
	if command -v curl >/dev/null; then
		mise_install_script="$(curl -fsSL https://mise.run)"
	elif command -v wget >/dev/null; then
		mise_install_script="$(wget -qO- https://mise.run)"
	else
		echo "To install mise, you must have curl or wget installed." >&2
		exit 1
	fi
	sh -c "${mise_install_script}"
	unset mise_install_script bin_dir
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
config_dir="${HOME}/.config/mise"
mise_config="${script_dir}/dotfiles/mise/config.toml"
mise_lock="${script_dir}/dotfiles/mise/mise.lock"

mkdir -p "${config_dir}"
ln -sfn "${mise_config}" "${config_dir}/config.toml"
ln -sfn "${mise_lock}" "${config_dir}/mise.lock"

"$mise" trust "${mise_config}"

set -- bootstrap --yes --force-dotfiles

echo "Running 'mise $*'" >&2
# exec: replace current process with mise
exec "$mise" "$@"
