# [dotfiles](https://jasonmorganson.github.io/dotfiles)

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup

Bootstrap a new machine without GitHub authentication. You can optionally export
the GitHub username whose public profile and SSH keys should be used:

```sh
# Optional
export GITHUB_USER="your-github-user"

curl -fsSL https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d/raw/setup.sh | sh
```

When available, `GITHUB_USER` is used for the current bootstrap and is not stored
in the mise config. Otherwise, bootstrap detects the authenticated GitHub CLI
user when possible.

[Source](https://gist.github.com/jasonmorganson/8a6fae35533bba8594a3e05e0bbe2f4d)

### Setup script

```sh
#!/bin/sh
set -eu

mkdir -p "$HOME/.local/share"
git clone https://github.com/jasonmorganson/dotfiles.git "$HOME/.local/share/dotfiles"
"$HOME/.local/share/dotfiles/install.sh"
```

## Usage

Pull the latest dotfiles and reapply the machine configuration:

```sh
bootstrap
```

`install.sh` is the no-argument setup entrypoint used by Codespaces and similar
environments. It installs `mise` to its standard user-local path before
bootstrapping:

> `mise bootstrap --yes --force-dotfiles`

Bootstrap requires Git 2.54 or newer and installs mise-managed hk globally
with config-based Git hooks. On macOS it installs a current Git through
Homebrew when the active version is too old; repositories without `hk.pkl`
remain unaffected.

See [reference](https://mise.jdx.dev/).

### macOS Touch ID for `sudo`

The bootstrap requires mise `v2026.8.12` or newer to manage privileged system
files. On macOS, it declaratively maintains `/etc/pam.d/sudo_local` with Touch
ID enabled, using Apple’s update-persistent sudo override. Inspect the planned
change before applying it:

```sh
mise bootstrap files status
mise bootstrap files apply --dry-run
bootstrap
```

### Docker Compose

`docker-compose run dotfiles`
