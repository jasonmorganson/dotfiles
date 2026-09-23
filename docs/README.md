# dotfiles

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup

Bootstrap a new machine with the following script:

```sh
curl -fsSL https://install.morganson.me |
  sh
```

Optionally use a different GitHub username and dotfiles repository:

```sh
curl -fsSL https://install.morganson.me |
  GITHUB_USER="your_github_user" sh
```

The value is used only for this installation. Without it, the installer adopts
the `jasonmorganson/dotfiles` repository.

## Layout

This is a global mise configuration repository. `mise bootstrap --adopt` clones
the repository root into `${XDG_CONFIG_HOME:-$HOME/.config}/mise`; with the
default XDG configuration, that is `~/.config/mise`.

`config.toml`, `conf.d/`, `mise-tasks/`, `tasks/`, `mise.lock`, and
`miserc.toml` are therefore kept at this repository's root. `mise-tasks/` holds
configuration-scoped tasks; `tasks/` holds tasks that mise exposes globally
from any working directory. `home/` contains explicit dotfile source files
and is not a special mise directory.

## Portability boundary

The adopted mise runtime—root configuration, `conf.d/`, `mise-tasks/`,
`mise.lock`, and `home/`—is portable and contains no repository-owner or
personal-identity defaults. Its GitHub task derives Git identity and signing
keys from the authenticated `gh` user when available.

The installer, hosted installation endpoint, and site documentation are
distribution assets for this repository and intentionally retain the
`jasonmorganson/dotfiles` and `morganson.me` references.

## Usage

Pull the latest dotfiles and reapply the machine configuration:

```sh
dotfiles
```

`install.sh` installs `mise` to its standard user-local path, adds it to
`PATH`, then adopts and fast-forwards the global configuration:

> `mise bootstrap --adopt jasonmorganson/dotfiles --update --yes --force-dotfiles`

Bootstrap requires Git 2.54 or newer and installs mise-managed hk globally
with config-based Git hooks. On macOS it installs a current Git through
Homebrew when the active version is too old; repositories without `hk.pkl`
remain unaffected.

See [reference](https://mise.jdx.dev/).

### macOS Touch ID for `sudo`

The bootstrap requires mise `v2026.9.6` or newer for declarative directories,
directory-backed dotfiles, and privileged system files. On macOS, it
declaratively maintains `/etc/pam.d/sudo_local` with Touch ID enabled, using
Apple’s update-persistent sudo override. Inspect the planned change before
applying it:

```sh
mise bootstrap files status
mise bootstrap files apply --dry-run
dotfiles
```

### Docker Compose

`docker-compose run dotfiles`
