# [dotfiles](https://jasonmorganson.github.io/dotfiles)

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup

From the canonical checkout, the no-argument installer fetches the pinned
[`jasonmorganson/etc`](https://github.com/jasonmorganson/etc) core into
`~/.local/share/etc`, applies its rootless shell and XDG configuration, then
applies the personal layer:

```sh
repo="$HOME/.local/share/dotfiles"
git clone https://github.com/jasonmorganson/dotfiles.git "$repo"
"$repo/install.sh"
```

Bootstrap a new machine without GitHub authentication, providing the GitHub
username whose public profile and SSH keys should be used:

```sh
curl -fsSL https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d/raw/setup.sh | sh -s -- your-github-user
```

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

### Setup script

```sh
#!/bin/sh
set -eu

repo="$HOME/.local/share/dotfiles"
export GITHUB_USER="${1:-${GITHUB_USER:?usage: setup.sh GITHUB_USERNAME}}"

rm -rf "$repo"
mkdir -p "${repo%/*}"
git clone https://github.com/jasonmorganson/dotfiles.git "$repo"
"$repo/install.sh"
"$HOME/.local/bin/mise" set --file "$HOME/.config/mise/config.local.toml" "GITHUB_USER=$GITHUB_USER"
```

## Usage

Pull the latest dotfiles and reapply the machine configuration:

```sh
bootstrap
```

`install.sh` is the no-argument setup entrypoint used by Codespaces and similar
environments. It installs `mise` to `~/.local/bin`, fetches the core config,
and then bootstraps the personal config without `sudo`:

> `mise bootstrap --yes --force-dotfiles`

See [reference](https://mise.jdx.dev/).

### Docker Compose

`docker-compose run dotfiles`
