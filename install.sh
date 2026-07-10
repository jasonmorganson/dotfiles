#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

if ! mise="$(command -v mise)"; then
	mise="${HOME}/.local/bin/mise"
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
fi

case $0 in
	*/*) self=$0 ;;
	*) self=$(command -v "$0") ;;
esac

script_dir="$(CDPATH= cd -P "$(dirname "$self")" && pwd -P)"
source_dir="${HOME}/.local/share/dotfiles"
config_dir="${HOME}/.config/mise"
mise_config="${source_dir}/dotfiles/mise/config.toml"
mise_lock="${source_dir}/dotfiles/mise/mise.lock"

if [ "${script_dir}" != "${source_dir}" ] && [ ! -e "${source_dir}" ]; then
	mkdir -p "$(dirname "${source_dir}")"
	ln -sfn "${script_dir}" "${source_dir}"
fi
mkdir -p "${config_dir}"
ln -sfn "${mise_config}" "${config_dir}/config.toml"
ln -sfn "${mise_lock}" "${config_dir}/mise.lock"

"$mise" trust "${mise_config}"

echo "Running 'mise bootstrap --yes --force-dotfiles'" >&2
# exec: replace current process with mise
exec "$mise" bootstrap --yes --force-dotfiles
