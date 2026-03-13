#!/bin/sh
set -eu

symphony_root="${HOME}/.local/share/symphony"
elixir_root="${symphony_root}/elixir"
state_dir="${HOME}/.local/state/chezmoi"
state_file="${state_dir}/symphony-built-rev"

[ -d "${symphony_root}/.git" ] || exit 0
[ -d "${elixir_root}" ] || exit 0

current_rev="$(git -C "${symphony_root}" rev-parse HEAD)"
last_built_rev=""
[ -f "${state_file}" ] && last_built_rev="$(cat "${state_file}")"

if [ -x "${elixir_root}/bin/symphony" ] && [ "${current_rev}" = "${last_built_rev}" ]; then
    exit 0
fi

if command -v mise >/dev/null 2>&1; then
    mise_bin="$(command -v mise)"
elif [ -x "${HOME}/.local/bin/mise" ]; then
    mise_bin="${HOME}/.local/bin/mise"
else
    echo "symphony setup skipped: mise is not installed" >&2
    exit 0
fi

mkdir -p "${state_dir}"

cd "${elixir_root}"
"${mise_bin}" trust
"${mise_bin}" install
"${mise_bin}" exec -- mix setup
"${mise_bin}" exec -- mix build

printf '%s\n' "${current_rev}" > "${state_file}"
