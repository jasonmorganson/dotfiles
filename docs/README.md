# dotfiles

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup

Bootstrap a new machine with the following script:

```sh
#!/bin/sh
set -eu

mkdir -p "$HOME/.local/share"
git clone https://github.com/jasonmorganson/dotfiles.git "$HOME/.local/share/dotfiles"
"$HOME/.local/share/dotfiles/install.sh"
```

You can optionally run `export GITHUB_USER="your-github-user"` first to use that
GitHub profile and its SSH keys. The value is not stored in the mise config.
Otherwise, bootstrap detects the authenticated GitHub CLI user when possible.

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
