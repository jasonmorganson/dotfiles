# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

set -- init --apply --source="${script_dir}/../../"

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
#exec "$chezmoi" "$@"
