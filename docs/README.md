# dotfiles

Dotfiles, bootstrapped with [`mise`](https://mise.jdx.dev/).

## Setup

Bootstrap a new machine with the following script:

```sh
curl -fsSL https://dotfiles.morganson.me |
  sh
```

Optionally use a different GitHub username and dotfiles repository:

```sh
curl -fsSL https://dotfiles.morganson.me |
  GITHUB_USER="your_github_user" sh
```

The value is not stored in the mise config. Otherwise, bootstrap detects the
authenticated GitHub CLI user when possible.

## Usage

Pull the latest dotfiles and reapply the machine configuration:

```sh
bootstrap
```

`install.sh` downloads the complete repository when streamed, or acts as the
no-argument setup entrypoint used by Codespaces and similar environments when
run from a checkout. It installs `mise` to its standard user-local path before
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
